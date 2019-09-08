class EventbriteService

  def initialize(connection)
    @connection =  Faraday.new(url: "https://www.eventbriteapi.com/v3")
  end

  def event_data
    @connection.get('/events/search') do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
    end
    JSON.parse(event_data.body, symbolize_names: true)[:events]
  end

  def ticket_data
    @connection.get("events/#{event_info[:id]}") do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
      req.params['expand'] = "ticket_classes"
    end
    JSON.parse(ticket_data.body, symbolize_names: true)[:ticket_classes]
  end

  def venue_data
    @connection.get("events/#{event_info[:id]}") do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY4
      req.params['expand'] = "venue"
    end
    JSON.parse(venue_data.body, symbolize_names: true)[:venue]
  end

  def genre_data
    @connection.get("categories") do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
    end 
    JSON.parse(genre_data.body, symbolize_names: true)[:categories]
  end
end
