class Event
  attr_accessor :id, :name, :url, :genre, :image_url, :venue_name,
                :address, :city, :state, :zip, :country, :date,
                :time, :status, :minPrice, :maxPrice

  def self.from_ticketmaster(data)
    event = Event.new
    event.id = data.id
    event.name = data.name
    event.url = data.data['url']
    event.genre = data.classifications[0].data['genre']['name']
    event.image_url = "http://design.ticketmaster.com/static/images/brand/logos/dont-4.svg"
    event.venue_name = data.venues[0].data['name']
    event.address = data.venues[0].data['address']['line1']
    event.city = data.venues[0].data['city']['name']
    event.state = data.venues[0].data['state']['name']
    event.zip = data.venues[0].data['postalCode']
    event.country = data.venues[0].data['country']['name']
    event.date = data.start['localDate']
    event.time = data.start['localTime']
    event.status = data.dates['status']['code']
    if data.data['priceRanges'] == nil
      event.minPrice && event.maxPrice = 'click link to find out more'
    else
      event.minPrice = data.data['priceRanges'][0]['min'] && event.maxPrice = data.data['priceRanges'][0]['max']
    end
    return event
  end

  def self.from_eventbrite(event_data, venue_data, ticket_data)
    event = Event.new
    event.id = event_data[:id]
    event.name = event_data[:name][:text]
    event.url = event_data[:url]
    event.image_url = event_data[:logo][:original][:url]
    event.venue_name = venue_data[:name]
    event.address = venue_data[:address][:address_1]
    event.city = venue_data[:address][:city]
    event.state = venue_data[:address][:region]
    event.zip = venue_data[:address][:postal_code]
    event.country = venue_data[:address][:country]
    event.date = event_data[:start][:local].to_date
    event.time = event_data[:start][:local][11..15]
    event.status = event_data[:status]
    event.minPrice = ticket_data
    event.maxPrice = nil
    if ticket_data == nil
      ticket_data = 'click link to find out more'
    end
    if event_data[:subcategory_id] == '5001'
      event.genre = 'Theatre'
    elsif event_data[:subcategory_id] == '5002'
      event.genre = 'Musical'
    elsif event_data[:subcategory_id] == '5003'
      event.genre = 'Ballet'
    else
      event.genre = 'Arts'
    end
    return event
  end
end
