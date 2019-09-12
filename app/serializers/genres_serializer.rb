class GenresSerializer

  def self.json(genres)
    genres.map { |genre| genre.to_json }
  end
end
