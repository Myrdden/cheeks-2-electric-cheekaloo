require 'spec_helper'
require './cheeks_in_seats.rb'
require 'rspec'
require 'rack/test'

ENV['APP_ENV'] = 'test'

describe "events index page" do
  it 'I see all event data' do
    get '/api/v1/events'

    expect(page).to have_content("ROOFTOP")
  end
end

# RSpec.describe 'The HelloWorld App' do
#   include Rack::Test::Methods
#
#   def app
#     Sinatra::Application
#   end
#
#   it "says hello" do
#     get '/'
#     expect(last_response).to be_ok
#     expect(last_response.body).to eq('Hello World')
#   end
# end
