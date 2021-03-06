class EventsController < Sinatra::Base
  get '/api/v1/events' do
    redis = RedisService.new
    redis.update('events', 1800) {
      EventsSerializer.json(EventsFacade.all_events)
    }
  end

  get '/api/v1/genres' do
    redis = RedisService.new
    redis.update('genres', 1800) {
      GenresSerializer.json(GenresFacade.all_genres)
    }
  end
end
