class GenresFacade

  def self.all_genres
    genres_data
  end

  def self.genres_data
    eventbrite_genre_data.map { |data| Genre.from_eventbrite(data) }
  end

  private
  def self.eventbrite_genre_data
    genre_info = EventbriteService.get_genres
    genre_info.find_all do |genre|
      genre[:parent_category][:id] == '105'
    end
  end
end
