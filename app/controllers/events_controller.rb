class EventsController < Sinatra::Base

  get '/api/v1/events' do
    events = EventsSerializer.new(EventsFacade.all_events)
    binding.pry
  end

  get '/api/v1/genres' do
    facade = GenresFacade.new
    GenresSerializer.new(facade)
  end
end
