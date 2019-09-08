class EventbriteService

  def authorization_headers
    headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
  end

  def venue_info
    response = Faraday.get("https://www.eventbriteapi.com/v3/events/#{event_id}/") do |request|
      request.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
      request.params['expand'] = "venue"
    end
    JSON.parse(response.body, symbolize_names: true)[:venue]
  end

  def genre_info
    response = Faraday.get("https://www.eventbriteapi.com/v3/categories/") do |request|
      request.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
    end
    JSON.parse(response.body, symbolize_names: true)[:categories]
  end
end
