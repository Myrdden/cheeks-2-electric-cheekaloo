require './cheeks_in_seats'

configure do
  require 'redis'
  # uri = URI.parse(ENV)
  $redis = Redis.new(:host => 'localhost')
end

# $redis.get(EventsSerializer.json(EventsFacade.all_events))

run EventsController
