##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'AvailableAddOn' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.marketplace.available_add_ons('XBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/marketplace/AvailableAddOns/XBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "XBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "VoiceBase High Accuracy Transcription",
          "description": "Automatic Transcription and Keyword Extract...",
          "pricing_type": "per minute",
          "configuration_schema": {
              "type": "object",
              "properties": {
                  "bad_words": {
                      "type": "boolean"
                  }
              },
              "required": [
                  "bad_words"
              ]
          },
          "url": "https://preview.twilio.com/marketplace/AvailableAddOns/XBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "extensions": "https://preview.twilio.com/marketplace/AvailableAddOns/XBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions"
          }
      }
      ]
    ))

    actual = @client.preview.marketplace.available_add_ons('XBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.marketplace.available_add_ons.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/marketplace/AvailableAddOns',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "available_add_ons": [
              {
                  "sid": "XBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "friendly_name": "VoiceBase High Accuracy Transcription",
                  "description": "Automatic Transcription and Keyword Extract...",
                  "pricing_type": "per minute",
                  "configuration_schema": {
                      "type": "object",
                      "properties": {
                          "bad_words": {
                              "type": "boolean"
                          }
                      },
                      "required": [
                          "bad_words"
                      ]
                  },
                  "url": "https://preview.twilio.com/marketplace/AvailableAddOns/XBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "links": {
                      "extensions": "https://preview.twilio.com/marketplace/AvailableAddOns/XBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions"
                  }
              }
          ],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://preview.twilio.com/marketplace/AvailableAddOns?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://preview.twilio.com/marketplace/AvailableAddOns?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "available_add_ons"
          }
      }
      ]
    ))

    actual = @client.preview.marketplace.available_add_ons.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "available_add_ons": [],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://preview.twilio.com/marketplace/AvailableAddOns?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://preview.twilio.com/marketplace/AvailableAddOns?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "available_add_ons"
          }
      }
      ]
    ))

    actual = @client.preview.marketplace.available_add_ons.list()

    expect(actual).to_not eq(nil)
  end
end