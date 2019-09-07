class AppController < Sinatra::Base

  get '/api/v1/events' do
    # params = {
    #   page: 5,
    #   size: 10,
    #   source: 'ticketmaster'
    # }
    # ticketmaster_client = Ticketmaster.client(apikey: ENV['TICKETMASTER-API-KEY'])
    # response = ticketmaster_client.search_events(params: params)
    # TicketmasterSerializer.json(response.results)

    EventbriteSerializer.json(response.results)
  end
end
