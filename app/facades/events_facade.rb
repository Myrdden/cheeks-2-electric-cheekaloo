class EventsFacade

  def initialize
    @events = all_events
  end

  def all_events
    ticketmaster_events = TicketmasterService.get_events
    eventbrite_events = EventbriteService.get_events
  end
end
