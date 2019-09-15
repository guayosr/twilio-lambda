require 'json'
require 'twilio-ruby'

def forward_message(event:,context:)
	# set up a client to talk to the Twilio REST API
	account_sid = ENV['twilio_account_sid']
	auth_token = ENV['twilio_auth_token']
	@client = Twilio::REST::Client.new account_sid, auth_token
	
	#to-do: figure out how to parse this to drop weird characters
	text_body = "From: " + 
		event['From'] + 
		"\n Text:" + 
		event['Body']
	
	@client.api.account.messages.create(
	  from: ENV['from_number'],
	  to: ENV['to_number'],
	  body: text_body
	)
	
	#to-do: return something so that Twilio knows it's been handled
end


def receive_and_record_call(event:,context:)
	# set up a client to talk to the Twilio REST API
	# account_sid = ENV['twilio_account_sid']
	# auth_token = ENV['twilio_auth_token']
	# @client = Twilio::REST::Client.new account_sid, auth_token
	
	# #1/ receive a call and send a text notifying who called
	# puts event
	
	# text_body = "Call from: " + event['From'] 
	
	# @client.api.account.messages.create(
	#   from: ENV['from_number'],
	#   to: ENV['to_number'],
	#   body: text_body
	# )
	
	#2/ record call and find easiest was to send output
	puts event
	
	recording = Twilio::TwiML::VoiceResponse.new do |r|
	    # Use <Say> to give the caller some instructions
	    r.say(message: 'Hello. Please leave a message after the beep.')
	
	    # Use <Record> to record the caller's message
	    r.record(transcribe: true)
	
	    # End the call with <Hangup>
	    r.hangup
	 end.to_s
	 
	 #puts recording
	
	#3/ record call and transcribe, puts it
	#4/ record call, transcribe, send it via email or text
	
end

	
	#builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
	#    xml.Response {
	#      xml.Message "Hello world! - Lambda w XML"
	#    }
	#end
	#return builder.to_xml
	
	# @client.api.account.calls.create(
	#   from: '+12487600161',
	#   to: '+525580366674',
	#   url: 'http://example.com'
	# )