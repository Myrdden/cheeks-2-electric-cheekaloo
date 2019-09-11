class EventsFacade

  def initialize
    @events = all_events
  end

  def all_events
    @_all_events ||= (ticketmaster_events_data + eventbrite_events_data)
  end

  def ticketmaster_events_data
    @_ticketmaster_events_data ||= ticketmaster_events.map { |data| Event.from_ticketmaster(data) }
  end

  def eventbrite_events_data
    @_eventbrite_events_data ||= event_data.map { |data| Event.from_eventbrite(event_data, venue_data, ticket_data) }
  end

  private
  def ticketmaster_events
    TicketmasterService.get_events
  end

  def eventbrite_service
    @_eventbrite_service ||= EventbriteService.new
  end

  def event_data
    eventbrite_service.get_events
  end

  def venue_data
    eventbrite_service.get_venues
  end

  def ticket_data
    eventbrite_service.get_tickets
  end
end

#   def self.genres(genre_info)
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
