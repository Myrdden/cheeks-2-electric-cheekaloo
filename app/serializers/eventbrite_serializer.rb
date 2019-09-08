class EventbriteSerializer

  def self.json(theatre_events, ticket_info, venue_info)
    json_array = []
    theatre_events.each do |event|
      obj = {
        name: event[:name][:text],
        url: event[:url],
        date: event[:start][:local].to_datetime,
        status: event[:status]
      }
      obj[:venue] = {
        name: venue_info[:name],
        address: venue_info[:address][:address_1],
        city: venue_info[:address][:city],
        state: venue_info[:address][:region],
        country: venue_info[:address][:country],
        zip: venue_info[:address][:postal_code]
      }
      if ticket_info != nil
        obj[:ticket] = {
          event[:maxPrice] => ticket_info
        }
      else
        'FREE'
      end
      json_array << obj
    end
    json_array.to_json
  end
end
