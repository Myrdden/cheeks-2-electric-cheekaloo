class EventsController < Sinatra::Base

  get '/api/v1/events' do
    binding.pry
    facade = EventsFacade.new
    EventsSerializer.new(facade)
  end

  get '/api/v1/genres' do
    facade = GenresFacade.new
    GenresSerializer.new(facade)
    # service = EventbriteService.new
    # genre_info = service.genre_data
    # EventbriteSerializer.genres(genre_info)
  end
end
