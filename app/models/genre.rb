class Genre
  attr_accessor :id,
                :name

  def self.from_eventbrite(data)
    genre = Genre.new
    genre.id = data[:id]
    genre.name = data[:name]
    return genre.to_json
  end
end
