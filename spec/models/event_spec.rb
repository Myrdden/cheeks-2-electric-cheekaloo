require './event.rb'
require 'spec_helper'
require './cheeks_in_seats.rb'
require 'rspec'
require 'rack/test'

ENV['APP_ENV'] = 'test'

describe Event do
  it "has exists" do
    event = Event.new
    assert_instance_of Event, event
  end
end
