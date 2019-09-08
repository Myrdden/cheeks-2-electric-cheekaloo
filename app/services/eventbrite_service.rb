class EventbriteService

  def initialize
    @connection = Faraday.new(url: "https://www.eventbriteapi.com/v3")
  end

  def event_data
    resp = @connection.get('events/search/') do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
    end
    JSON.parse(resp.body, symbolize_names: true)[:events]
  end

  def ticket_data
    id = event_data[0][:id]
    resp = @connection.get("events/#{id}/") do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
      req.params['expand'] = "ticket_classes"
    end
    JSON.parse(resp.body, symbolize_names: true)[:ticket_classes][0][:actual_cost]
  end

  def venue_data
    id = event_data[0][:id]
    resp = @connection.get("events/#{id}/") do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
      req.params['expand'] = "venue"
    end
    JSON.parse(resp.body, symbolize_names: true)[:venue]
    # binding.pry
  end

  def genre_data
    resp = @connection.get("categories/105/") do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
    end
    JSON.parse(resp.body, symbolize_names: true)[:id]
  end
end
