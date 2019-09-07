class EventbriteSerializer

  def self.json
    json_array = []
    service_events.each do |event|
      obj = {
        name: event[:name],
        url: event[:url],
        date: event[:start][:local][0..9],
        time: event[:start][:local][15..19],
        status: event[:status]
      }
      event_venue = service_venues.find { |venue| venue.id == event.venue_id }
      obj[:venue] = {
        name: event_venue[:name],
        address: event_venue[:address][:address_1],
        city: event_venue[:address][:city],
        state: event_venue[:address][:region],
        country: event_venue[:address][:country],
        zip: event_venue[:address][:postal_code]
      }
      obj[:genre] = service_genres.find { |category| category.id == event.category_id }
    json_array << obj
    json_array.to_json
  end

  private
  def service
    @_service ||= EventbriteService.new
  end

  def service_events
    @_service_events ||= service.events
  end

  def service_venues
    @_service_venues ||= service.venues
  end

  def service_tickets
    @_service_tickets ||= service.tickets
  end

  def service_genres
    @_service_genres ||= service.genres
  end
end
