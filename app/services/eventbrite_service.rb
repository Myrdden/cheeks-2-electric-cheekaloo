class EventbriteService
  def self.get_events
    resp = Faraday.get('https://www.eventbriteapi.com/v3/events/search/') do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
      req.params['categories'] = '105'
    end
    JSON.parse(resp.body, symbolize_names: true)[:events]
  end

  def self.get_tickets(event_id)
    resp = Faraday.get("https://www.eventbriteapi.com/v3/events/#{event_id}/") do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
      req.params['expand'] = "ticket_classes"
    end
    JSON.parse(resp.body, symbolize_names: true)[:ticket_classes][0][:cost]
  end

  def self.get_venues(event_id)
    resp = Faraday.get("https://www.eventbriteapi.com/v3/events/#{event_id}/") do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
      req.params['expand'] = "venue"
    end
    JSON.parse(resp.body, symbolize_names: true)[:venue]
  end

  def get_genres
    resp = Faraday.get("subcategories/") do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
    end
    JSON.parse(resp.body, symbolize_names: true)[:subcategories]
  end
end
