require 'json'
require 'twilio-ruby'

def hello_world(event:,context:)
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
end

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