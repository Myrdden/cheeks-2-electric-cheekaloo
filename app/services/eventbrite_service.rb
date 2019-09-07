class EventbriteService

  def events
    event_info
  end

  def venues
    venue_info  
  end

  def tickets
    ticket_info
  end

  def genre
    genre_info
  end

  private
  def event_info
    response = Faraday.get("https://www.eventbriteapi.com/v3/events/search") do |request|
      request.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
    end
    JSON.parse(response.body, symbolize_names: true)[:events]
  end

  def venue_info
    response = Faraday.get("https://www.eventbriteapi.com/v3/events/#{event_id}/") do |request|
      request.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
      request.params['expand'] = "venue"
    end
    JSON.parse(response.body, symbolize_names: true)[:venue]
  end

  def ticket_info
    response = Faraday.get("https://www.eventbriteapi.com/v3/events/#{event_id}") do |request|
      request.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
      request.params['expand'] = "ticket_classes"
    end
    JSON.parse(response.body, symbolize_names: true)[:ticket_classes]
  end

  def genre_info
    response = Faraday.get("https://www.eventbriteapi.com/v3/categories/") do |request|
      request.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
    end
    JSON.parse(response.body, symbolize_names: true)[:categories]
  end
end
