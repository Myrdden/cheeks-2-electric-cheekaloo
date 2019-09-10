class EventbriteService

  def initialize
    @connection = Faraday.new(url: "https://www.eventbriteapi.com/v3")
  end

  def get_events
    resp = @connection.get('events/search/') do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
      req.params['categories'] = '105'
    end
    JSON.parse(resp.body, symbolize_names: true)[:events]
  end

  def get_tickets
    id = event_data[0][:id]
    resp = @connection.get("events/#{id}/") do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
      req.params['expand'] = "ticket_classes"
    end
    JSON.parse(resp.body, symbolize_names: true)[:ticket_classes][0][:cost]
  end

  def get_venues
    id = event_data[0][:id]
    resp = @connection.get("events/#{id}/") do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
      req.params['expand'] = "venue"
    end
    JSON.parse(resp.body, symbolize_names: true)[:venue]
  end

  def get_genres
    resp = @connection.get("subcategories/") do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
    end
    JSON.parse(resp.body, symbolize_names: true)[:subcategories]
  end
end
