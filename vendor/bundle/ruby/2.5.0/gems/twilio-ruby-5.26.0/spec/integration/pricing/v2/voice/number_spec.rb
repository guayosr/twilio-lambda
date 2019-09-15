##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Number' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.pricing.v2.voice \
                        .numbers('+15017122661').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://pricing.twilio.com/v2/Voice/Numbers/+15017122661',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "country": "United States",
          "destination_number": "+18001234567",
          "inbound_call_price": {
              "base_price": null,
              "current_price": null,
              "number_type": null
          },
          "iso_country": "US",
          "origination_number": "+987654321",
          "outbound_call_prices": [
              {
                  "base_price": "0.013",
                  "current_price": "0.013",
                  "origination_prefixes": [
                      "ALL"
                  ]
              }
          ],
          "price_unit": "USD",
          "url": "https://pricing.twilio.com/v2/Voice/Numbers/+18001234567"
      }
      ]
    ))

    actual = @client.pricing.v2.voice \
                               .numbers('+15017122661').fetch()

    expect(actual).to_not eq(nil)
  end
end