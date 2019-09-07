require './events.json'

class EventbriteSerializer

  def self.json(response)
    # json_array = []
    # response.each do |result|
    #   obj = {
    #     name: result.data['name'],
    #     url: result.data['url'],
    #     genre: result.data['category_id']
    #   }
    #   result_venue = result.venue_id.venue
    #   obj[]

  end

  def service
    EventbriteService.new
  end

  def service_events
    service.events
  end

  def service_venues
    service.venues
  end

  def service_tickets
    service.tickets
  end

  def service_genres
    service.genres
  end
end
