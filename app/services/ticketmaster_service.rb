class TicketmasterService

  def self.get_events
    params = {
      page: 5,
      size: 20,
      source: 'ticketmaster',
      countryCode: 'US',
      classificationName: 'theatre'
    }
    ticketmaster_client = Ticketmaster.client(apikey: ENV['TICKETMASTER-API-KEY'])
    response = ticketmaster_client.search_events(params: params)
    response.results
  end

  def self.get_genres
    params = {
      page: 5,
      size: 20,
      source: 'ticketmaster',
      countryCode: 'US'
      # classificationName: 'theatre'
    }
    ticketmaster_client = Ticketmaster.client(apikey: ENV['TICKETMASTER-API-KEY'])
    response = ticketmaster_client.search_classifications(params: params)
    binding.pry
    response.results
  end

end
