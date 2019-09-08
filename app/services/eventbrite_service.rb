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
    event_info = event_data
    binding.pry
    resp = @connection.get("events/#{event_info[:id]}/") do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
      req.params['expand'] = "ticket_classes"
    end
    JSON.parse(resp.body, symbolize_names: true)[:ticket_classes]
  end

  def venue_data
    event_info = event_data
    resp = @connection.get("events/#{event_info[:id]}/") do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
      req.params['expand'] = "venue"
    end
    binding.pry
    JSON.parse(resp.body, symbolize_names: true)[:venue]
  end

  def genre_data
    resp = @connection.get("events/search/") do |req|
      req.headers['Authorization'] = 'Bearer ' + ENV['EVENTBRITE-API-KEY']
      req.params['categories'] = '105'
    end
    binding.pry
    JSON.parse(resp.body, symbolize_names: true)[:categories]
  end
end
