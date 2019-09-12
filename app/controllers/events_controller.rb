

class EventsController < Sinatra::Base
  register Sinatra::Cache
  get '/api/v1/events' do
    # settings.cache.expires('events', 60)
    # settings.cache.clear
    settings.cache.fetch('events'){
      EventsSerializer.json(EventsFacade.all_events)
    }
  end

  get '/api/v1/genres' do
    # settings.cache.clear
    settings.cache.fetch('genres'){
    GenresSerializer.json(GenresFacade.all_genres)
  }
  end

  def cache_clearing
    settings.cache.clear 
  end
end


# 2. Create a Rake task which runs once on the hour or half our maybe
# (I'm not sure entirely how to do this, apparently Heroku has an auto-running
#   feature or something, need to Google it or ask an instructor how) that does
#   what our `api/v1/events` endpoint does now, i.e. Fetches all events in
#   Denver from our two APIs, and through our inbelievably convoluted pipeline
#    converts them into one big ol' uniform JSON string
# 3. That JSON string will be stored in Redis, and we change the `api/v1/events`
#  endpoint to instead retrieve whatever has been stored in our cache and serve
#   it up
# 4. The only hang-up is that when we want to perform a filter on our data,
#  we'll have to retrieve the JSON string, turn it back into Event objects,
#  do our filtering, and then turn the objects back into another JSON string
#    (tho we can also cache those to increase performance, however this might
#      be unecessary as there's already a filtered cache on the Rails app, but
#      we can move it over and consolidate). I don't see this as too much of
#      a drawback because that whole process, while silly to us humans, is
#      probably trivial for the app to perform.
#
#      3. When you want to access the server, make a `redis = Redis.new(host: 'your/hostname')`
#      (probably `'localhost'` for now) object, it's just a wrapper so you don't
#       need to worry about memoizing it or anything
#      4. Redis is basically a more complicated Hash, so really all you do
#        with it is store key:value pairs, like the Rails cache. Access
#        something with `redis.get('key')` and set something with
#        `redis.set('key', 'value')`, you can set something to expire
#        automatically with `redis.setex('key', exp, 'value')` where `exp`
#         is the time in seconds before it should expire
