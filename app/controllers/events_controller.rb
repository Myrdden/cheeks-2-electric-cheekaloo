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
    event_info = service.event_data
    ticket_info = service.ticket_data
    venue_info = service.venue_data
    EventbriteSerializer.json(event_info, ticket_info, venue_info)
  end

  get '/api/v1/genres' do
    service = EventbriteService.new
    event_info = service.event_data
    EventbriteSerializer.genres(event_info)
  end
end
