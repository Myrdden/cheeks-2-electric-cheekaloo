class EventbriteSerializer

  def self.json
    json_array = []
    service_events.each do |event|
      obj = {
        name: event[:name],
        url: event[:url],
        date: event[:start][:local][0..9],
        time: event[:start][:local][15..19],
        status: event[:status],
        genre: event[:category_id]
      }
      obj[:venue] = {
        name: event_venue[:name],
        address: event_venue[:address][:address_1],
        city: event_venue[:address][:city],
        state: event_venue[:address][:region],
        country: event_venue[:address][:country],
        zip: event_venue[:address][:postal_code]
      }
    end
    json_array << obj
    json_array.to_json
  end
end
