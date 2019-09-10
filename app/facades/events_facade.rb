class EventsFacade

  def initialize
    @events = all_events
  end

  def all_events
    # ticketmaster_events
  end

  def ticketmaster_events
    TicketmasterService.get_events
    # event_data = raw_data.data.symbolize_names
    # event_data.map { |event| Event.new(event) }
  end

  def ticketmaster_formatting
    binding.pry
    events_json_objects = []
    ticketmaster_events.each do |event|
      obj = {
        name: event['name'],
        url: event['url'],
        genre: event['classifications'][0]['genre']['name'],
        image_url: event['images'][0]['url'],
        venue_name: event['_embedded']['venues'][0]['name'],
        address: event['_embedded']['venues'][0]['address']['line1'],
        city: event['_embedded']['venues'][0]['city']['name'],
        state: event['_embedded']['venues'][0]['state']['name'],
        zip: event['_embedded']['venues'][0]['postalCode'],
        country: event['_embedded']['venues'][0]['country']['name'],
        minPrice: event,
        maxPrice: event
        date: event,
        time: event,
        status: event
      }
      events_json_objects << obj
    end
    events_json_objects
  end

  def eventbrite_events
    event_data.map { |event| Event.new(event) }
  end

  def eventbrite_formatting
    events_json_objects = []
    eventbrite_events.each do |event|
      obj = {
        name: event[:name][:text],
        url: event[:url],
      }
      if event[:subcategory_id] == '5001'
        obj[:genre] = 'Theatre'
      elsif event[:subcategory_id] == '5002'
        obj[:genre] = 'Musical'
      elsif event[:subcategory_id] == '5003'
        obj[:genre] = 'Ballet'
      else
        obj[:genre] = 'Arts'
      end
      obj[:venue] = {
        name: venue_info[:name],
        address: venue_info[:address][:address_1],
        city: venue_info[:address][:city],
        state: venue_info[:address][:region],
        country: venue_info[:address][:country],
        zip: venue_info[:address][:postal_code]
      }
      if ticket_info != nil
        obj[:minPrice] = ticket_info
      else
        obj[:maxPrice] = "Click link to find out more"
      end
      obj[:date] = {
        date: event[:start][:local].to_date,
        time: event[:start][:local].to_,
        status: event[:status]
      }
      events_json_objects << obj
    end
    events_json_objects
  end
end

  # def eventbrite_event_data
  #   binding.pry
  #   eventbrite_service = EventbriteService.new
  #   eventbrite_service.get_events
  # end



  # def self.json(event_info, ticket_info, venue_info)
  #   json_array.to_json
  # end





#   def self.genres(genre_info)
#     main_category = genre_info.find_all do |genre|
#       genre[:parent_category][:id] == '105'
#     end
#     json_genres = []
#     main_category.each do |genre|
#       obj = {
#         id: genre[:id],
#         name: genre[:name]
#       }
#     json_genres << obj
#     end
#     json_genres.to_json
#   end
