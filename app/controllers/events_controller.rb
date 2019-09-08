class EventsController < Sinatra::Base

  get '/api/v1/events' do
    # params = {
    #   page: 5,
    #   size: 10,
    #   source: 'ticketmaster'
    # }
    # ticketmaster_client = Ticketmaster.client(apikey: ENV['TICKETMASTER-API-KEY'])
    # response = ticketmaster_client.search_events(params: params)
    # TicketmasterSerializer.json(response.results)

    service = EventbriteService.new
    genre_info = service.genre_data
    event_info = service.event_data
    ticket_info = service.ticket_data
    venue_info = service.venue_data
    theatre_events = event_info.find_all do |event|
      event[:category_id] == genre_info
    end
    EventbriteSerializer.json(theatre_events, ticket_info, venue_info)
  end
end
