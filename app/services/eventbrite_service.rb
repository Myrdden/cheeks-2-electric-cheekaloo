class EventbriteService

  def events
    response = Faraday.get("https://www.eventbriteapi.com/v3/events/search") do |request|
      request.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
    end
    JSON.parse()
  end

  def venues
  end

end
