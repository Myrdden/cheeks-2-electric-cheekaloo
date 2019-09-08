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
    # connection =
    service = EventbriteService.new
    # event_data = service.get('events/search') do |req|
    #   req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
    # end
    event_info = service.event_data
    ticket_info = service.ticket_data
    binding.pry
    venue_info = service.venue_data
    genre_info = service.genre_data
    # ticket_data = service.get("events/#{event_info[:id]}") do |req|
    #   req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
    #   req.params['expand'] = "ticket_classes"
    # end
    # ticket_info = JSON.parse(ticket_data.body, symbolize_names: true)[:ticket_classes]
    # venue_data = service.get("events/#{event_info[:id]}") do |req|
    #   req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
    #   req.params['expand'] = "venue"
    # end
    # venue_info = JSON.parse(venue_data.body, symbolize_names: true)[:venue]
    # genre_data = service.get("categories") do |req|
    #   req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
    # end
    # genre_info = JSON.parse(genre_data.body, symbolize_names: true)[:categories]
    EventbriteSerializer.json(event_info, ticket_info, venue_info, genre_info)
  end
end
