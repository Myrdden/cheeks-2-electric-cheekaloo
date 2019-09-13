task :refresh do
  redis = RedisService.new
  redis.fetchex('events', 1800) {
    EventsSerializer.json(EventsFacade.all_events)
  }
  redis.fetchex('genres', 1800) {
    GenresSerializer.json(GenresFacade.all_genres)
  }
end
