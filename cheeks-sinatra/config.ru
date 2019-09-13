require './cheeks_in_seats'

configure do
  require 'redis'
  # uri = URI.parse(ENV)
  $redis = Redis.new(:host => 'localhost', :port => '3000')
end

run EventsController
