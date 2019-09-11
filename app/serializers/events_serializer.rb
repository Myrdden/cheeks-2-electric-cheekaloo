  def initialize(events)
    events.map! { |event| event.to_json }
  end
end
