require 'json'
require 'twilio-ruby'

account_sid = ENV['twilio_account_sid']
auth_token = ENV['twilio_auth_token']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

def hello_world(event)
	puts "ENV variable"
	puts ENV['TEST']
	puts "This is the end of the event"
	
	
	puts "Received event:"
	puts event
	puts "This is the end of the event"
	
	return '<?xml version="1.0" encoding="UTF-8"?>'\
           '<Response><Message>Hello world! -Lambda</Message></Response>'
	
	#standard Lambda rest response
	#{ statusCode: 200, body: JSON.generate('Hello from Twilioland') }
	
	# @client.api.account.calls.create(
	#   from: '+12487600161',
	#   to: '+525580366674',
	#   url: 'http://example.com'
	# )

	# @client.api.account.messages.create(
	#   from: '+12487600161',
	#   to: '+525580366674',
	#   body: 'HOLA MUNDO'
	# )
end