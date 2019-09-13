require 'spec_helper'
require 'rspec'
require 'rack/test'
require 'webmock'

ENV['APP_ENV'] = 'test'

RSpec.describe "events index page" do
  it 'I see all event data' do
    response = stub_events_api_call
    str_response = response.to_s

    expect(str_response).to include("search")
  end
end
