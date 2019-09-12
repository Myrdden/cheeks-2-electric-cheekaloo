class EventsSerializer
  def self.json(events)
    events.map! { |event| event.to_json }
  end
end
