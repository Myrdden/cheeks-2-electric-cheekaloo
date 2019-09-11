class EventsController < Sinatra::Base

  get '/api/v1/events' do
    facade = EventsFacade.new
    EventsSerializer.new(facade)

    #
    # service = EventbriteService.new
    # event_info = service.event_data
    # ticket_info = service.ticket_data
    # venue_info = service.venue_data
    # EventbriteSerializer.json(event_info, ticket_info, venue_info)
  end

  # get '/api/v1/genres' do
  #   service = EventbriteService.new
  #   genre_info = service.genre_data
  #   EventbriteSerializer.genres(genre_info)
  # end
end
