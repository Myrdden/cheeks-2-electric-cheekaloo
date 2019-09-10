class Event

  def initialize(attrs = {})
    binding.pry
    @name = attrs[:name]
    @url = attrs[:url]
    @genre = attrs[:genre]
    @image_url = attrs[:image_url]
    @venue_name = attrs[:venue_name]
    @address = attrs[:address]
    @city = attrs[:city]
    @state = attrs[:state]
    @zip = attrs[:zip]
    @country = attrs[:country]
    @date = attrs[:date]
    @time = attrs[:time]
    @status = attrs[:status]
  end
end
