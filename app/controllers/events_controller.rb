class EventsController < Sinatra::Base

  def initialize(connection)
    @connection = Faraday.new(url: "https://www.eventbriteapi.com/v3/events")
  end

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
    event_data = @connection.get('search') do |req|
      req.service.authorization_headers
    end
    event_info = JSON.parse(event_data.body, symbolize_names: true)[:events]
    ticket_data = @connection.get("#{event_info[:id]}") do |req|
      req.service.authorization_headers
      req.params['expand'] = "ticket_classes"
    end
    ticket_info = JSON.parse(ticket_data.body, symbolize_names: true)[:ticket_classes]
    # venue_data = service.venue_info.find { |venue| events[:venue_id] == venue.id }
    # genre_data = service.genre_info.find { |category| events[:category_id] == category.id }
    EventbriteSerializer.json(event_info, ticket_info, venue_info, genre_info)
  end
end

# 2. Instead of having a `Faraday.get` call inside of duplicate private
# methods repeated a dozen times, make a Faraday.new object when you
# initialise EventController and use that
