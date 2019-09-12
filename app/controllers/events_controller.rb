class EventsController < Sinatra::Base
  get '/api/v1/events' do
    events = EventsSerializer.json(EventsFacade.all_events)
  end

  get '/api/v1/genres' do
    facade = GenresFacade.new
    GenresSerializer.new(facade)
  end
end
