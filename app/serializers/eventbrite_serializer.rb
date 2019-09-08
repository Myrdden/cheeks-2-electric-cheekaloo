class EventbriteSerializer

  def self.json(event_info, ticket_info, venue_info, genre_info)
    json_array = []
    
    event_info.each do |event|
      obj = {
        name: event[:name][:text],
        url: event[:url],
        date: event[:start][:local].to_datetime,
        status: event[:status],
        genre: event[:category_id]
      }
      obj[:venue] = {
        name: venue_info[:name],
        address: venue_info[:address][:address_1],
        city: venue_info[:address][:city],
        state: venue_info[:address][:region],
        country: venue_info[:address][:country],
        zip: venue_info[:address][:postal_code]
      }
    end
    json_array << obj
    json_array.to_json
  end
end
