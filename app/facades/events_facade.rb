class EventsFacade

  def self.all_events
    ticketmaster_events_data + eventbrite_events_data
  end

  def self.ticketmaster_events_data
    ticketmaster_events.map { |data| Event.from_ticketmaster(data) }
  end

  def self.eventbrite_events_data
    eventbrite_events.map { |event| Event.from_eventbrite(event, venues(event[:id]), tickets(event[:id])) }
  end

  private
  def self.ticketmaster_events
    TicketmasterService.get_events
  end

  def self.eventbrite_events
    EventbriteService.get_events
  end

  def self.venues(id)
    EventbriteService.get_venues(id)
  end

  def self.tickets(id)
    EventbriteService.get_tickets(id)
  end
end
