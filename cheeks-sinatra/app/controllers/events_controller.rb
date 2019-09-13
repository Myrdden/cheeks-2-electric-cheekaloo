class EventsController < Sinatra::Base
  get '/api/v1/events' do
    EventsSerializer.json(EventsFacade.all_events)
  end

  get '/api/v1/genres' do
    GenresSerializer.json(GenresFacade.all_genres)
  end
end
