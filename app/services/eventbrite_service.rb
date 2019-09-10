class EventbriteService

  def initialize
    @connection = Faraday.new(url: "https://www.eventbriteapi.com/v3")
  end

  def self.get_events
    resp = @connection.get('events/search/') do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
      req.params['categories'] = '105'
    end
    JSON.parse(resp.body, symbolize_names: true)[:events]
  end

  def self.ticket_data
    id = event_data[0][:id]
    resp = @connection.get("events/#{id}/") do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
      req.params['expand'] = "ticket_classes"
    end
    JSON.parse(resp.body, symbolize_names: true)[:ticket_classes][0][:cost]
  end

  def self.venue_data
    id = event_data[0][:id]
    resp = @connection.get("events/#{id}/") do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
      req.params['expand'] = "venue"
    end
    JSON.parse(resp.body, symbolize_names: true)[:venue]
  end

  def self.genre_data
    resp = @connection.get("subcategories/") do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
    end
    JSON.parse(resp.body, symbolize_names: true)[:subcategories]
  end
end
