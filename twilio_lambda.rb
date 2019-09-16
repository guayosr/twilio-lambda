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
	#set up a client to talk to the Twilio REST API
	account_sid = ENV['twilio_account_sid']
	auth_token = ENV['twilio_auth_token']
	@client = Twilio::REST::Client.new account_sid, auth_token
	
	puts "Processing event:"
	puts event
	
	case event['CallStatus']
		when'ringing'
			puts "Processing ring:"
			response = Twilio::TwiML::VoiceResponse.new do |r|
			    # Use <Say> to give the caller some instructions
			    # to-do: different message based on MX vs US
			    
			    if event['CallerCountry']=='MX' then
		    		r.say(message: 'Por favor deja tu mensaje despues del tono', language:'es-MX', voice:'alice')
		    	else 
		    		r.say(message: 'Hello. Please leave a message after the beep.', language:'en-US', voice:'alice')
			    end
			    
			    # Use <Record> to record the caller's message
			    r.record(transcribe: true)
			
			    # End the call with <Hangup>
			    r.hangup
			 end.to_s
			 puts "Finished recording"
		when 'completed'
			puts "Processing completion:"
			text_body = "You had a call from: " +
				event['From'] +
				"\n Audio Recording:" +
				CGI.unescape(event['RecordingUrl'])
	
			@client.api.account.messages.create(
			  from: ENV['from_number'],
			  to: ENV['to_number'],
			  body: text_body,
			  #media_url: ['https://img.etimg.com/thumb/msid-68738133,width-643,imgsize-70881,resizemode-4/twittersized.jpg']
			)
	end
	response	 
end