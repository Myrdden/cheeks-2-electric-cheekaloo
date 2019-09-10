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
        genre: event['classifications']['genre']['name'],
        image_url: event['images']['url'],
        venue_name: event['_embedded']['venues']['name'],
        address: event['_embedded']['venues']['address']['line1'],
        city: event['_embedded']['venues']['city']['name'],
        state: event['_embedded']['venues']['state']['name'],
        zip: event['_embedded']['venues']['postalCode'],
        country: event['_embedded']['venues']['country']['name'],
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

  # def eventbrite_events
  #   event_data.map { |event| Event.new(event) }
  # end

  def eventbrite_formatting
    events_json_objects = []
    eventbrite_service = EventbriteService.new
    eventbrite_events = eventbrite_service.get_events
    eventbrite_venues = eventbrite_service.get_venues
    eventbrite_tickets = eventbrtie_service.get_tickets
    eventbrite_events.each do |event|
      obj = {
        name: event[:name][:text],
        url: event[:url],
        image_url: event[:logo][:original][:url],
        venue_name: eventbrite_venues[:name],
        address: eventbrite_venues[:address][:address_1],
        city: eventbrite_venues[:address][:city],
        state: eventbrite_venues[:address][:region],
        country: eventbrite_venues[:address][:country],
        zip: eventbrite_venues[:address][:postal_code],
        date: event[:start][:local].to_date,
        time: event[:start][:local],
        status: event[:status]
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
      if eventbrite_tickets != nil
        obj[:minPrice] = eventbrite_tickets
      else
        obj[:maxPrice] = nil
      end
      events_json_objects << obj
    end
    events_json_objects
  end
end





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
