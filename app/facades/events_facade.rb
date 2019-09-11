class EventsFacade

  def initialize
    @events = all_events
  end

  def all_events
    binding.pry
    ticketmaster_events_data
    eventbrite_events_data
  end

  def ticketmaster_events_data
    ticketmaster_event_data.map { |data| Event.from_ticketmaster(data) }
  end

  def eventbrite_events_data
    event_data.map { |data| Event.from_eventbrite(event_data, venue_data, ticket_data, genre_data) }
  end

  private
  def ticketmaster_event_data
    TicketmasterService.get_events
  end

  def event_data
    service = EventbriteService.new
    service.get_events
  end

  def venue_data
    service = EventbriteService.new
    service.get_venues
  end

  def ticket_data
    service = EventbriteService.new
    service.get_tickets
  end

  def genre_data
    service = EventbriteService.new
    nonfiltered = service.get_genres
    nonfiltered.find_all { |genre| genre[:parent_category][:id] == '105'}
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
