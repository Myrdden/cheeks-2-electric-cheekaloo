class TicketmasterService

  def self.get_events
    params = {
      page: 5,
      size: 10,
      source: 'ticketmaster'
    }
    ticketmaster_client = Ticketmaster.client(apikey: ENV['TICKETMASTER-API-KEY'])
    response = ticketmaster_client.search_events(params: params)
    # TicketmasterSerializer.json(response.results)
    response.results[0].data
  end
end
