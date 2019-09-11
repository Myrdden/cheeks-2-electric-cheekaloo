class GenresFacade

  def initialize
    @genres = all_genres
  end

  def all_genres
    @_all_genres ||= (ticketmaster_genres_data + eventbrite_genres_data)
  end

  def ticketmaster_genres_data
    @_ticketmaster_genres_data ||= ticketmaster_genres.map { |data| Genre.from_ticketmaster(data) }
  end

  def eventbrite_genres_data
  end

  private
  def ticketmaster_genres
    TicketmasterService.get_genres
  end

  def eventbrite_service
    @_eventbrite_service ||= EventbriteService.new
  end

  def genre_data
    service = EventbriteService.new
    genre_info = service.get_genres
    genre_info.find_all do |genre|
      genre[:parent_category][:id] == '105'
    end
  end
end
