class TicketmasterSerializer
  def self.json(response_array)
    json_array = []
    response_array.each do |result|
      obj = {
        name: result.data['name'],
        url: result.data['url'],
        genre: result.data['classifications'][0]['genre']['name']
      }
      result_venue = result.venues.first.data
      obj[:venue] = {
        address: result_venue['address']['line1'],
        city: result_venue['city']['name'],
        state: result_venue['state']['name'],
        country: result_venue['country']['name'],
        zip: result_venue['postalCode']
      }
      dates = result.dates
      obj[:date] = {
        date: dates['start']['localDate'],
        time: dates['start']['localTime'],
        status: dates['status']['code']
      }

      json_array << obj
    end

    json_array.to_json
  end
end
