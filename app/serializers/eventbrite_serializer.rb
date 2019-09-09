class EventbriteSerializer

  def self.json(event_info, ticket_info, venue_info)
    json_array = []
    event_info.each do |event|
      obj = {
        name: event[:name][:text],
        url: event[:url],
        date: event[:start][:local].to_datetime,
        status: event[:status],
      }
      obj[:venue] = {
        name: venue_info[:name],
        address: venue_info[:address][:address_1],
        city: venue_info[:address][:city],
        state: venue_info[:address][:region],
        country: venue_info[:address][:country],
        zip: venue_info[:address][:postal_code]
      }
      if event[:subcategory_id] == '5001'
        obj[:genre] = 'Theatre'
      elsif event[:subcategory_id] == '5002'
        obj[:genre] = 'Musical'
      elsif event[:subcategory_id] == '5003'
        obj[:genre] = 'Ballet'
      else
        obj[:genre] = 'Arts'
      end
      if ticket_info != nil
        obj[:maxPrice] = ticket_info
      else
        obj[:maxPrice] = "Click link to find out more"
      end
      json_array << obj
    end
    json_array.to_json
  end

  def self.genres(genre_info)
    # binding.pry
    main_category = genre_info.find_all do |genre|
      genre[:parent_category][:id] == '105'
    end
    json_genres = []
    main_category.each do |genre|
      obj = {
        id: genre[:id],
        name: genre[:name]
      }
    json_genres << obj
    end
    json_genres.to_json
  end
end
