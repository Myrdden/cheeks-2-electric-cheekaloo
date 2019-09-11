class GenresFacade

  def initialize
    @genres = all_genres
  end

  def all_genres
    @_all_genres ||= genres_data
  end

  def genres_data
    @_eventbrite_genres_data ||= eventbrite_genre_data.map { |data| Genre.from_eventbrite(data) }
  end

  private

  def eventbrite_service
    @_eventbrite_service ||= EventbriteService.new
  end

  def eventbrite_genre_data
    genre_info = eventbrite_service.get_genres
    genre_info.find_all do |genre|
      genre[:parent_category][:id] == '105'
    end
  end
end
