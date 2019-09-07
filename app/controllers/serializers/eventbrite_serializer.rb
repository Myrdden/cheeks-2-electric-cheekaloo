class EventbriteSerializer

  def self.json(response)
    json_array = []
    response.each do |result|
      obj = {
        name: result.data['name'],
        url: result.data['url'],
        genre: result.data['category_id']
      }
      result_venue = result.venue_id.venue
      obj[]

  end
end
