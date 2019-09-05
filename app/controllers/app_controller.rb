class AppController < Sinatra::Base

  get '/api/v1/events' do
    params = {
      # postalCode: '80204',
      city: 'Denver',
      classificationName: '[\'Theatre\']',
      source: 'ticketmaster',
      size: '100'
    }
    # params = {source: 'ticketmaster', page: '0', size: '20'}
    ticketmaster_client = Ticketmaster.client(apikey: ENV['TICKETMASTER-API-KEY'])
    response = ticketmaster_client.search_events(params: params)
    TicketmasterSerializer.json(response.results)
  end
end
