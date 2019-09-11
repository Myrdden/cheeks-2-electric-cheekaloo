class EventsController < Sinatra::Base

  get '/api/v1/events' do
    facade = EventsFacade.new
    EventsSerializer.new(facade)
  end

  get '/api/v1/genres' do
    facade = GenresFacade.new
    GenresSerializer.new(facade)
  end
end
