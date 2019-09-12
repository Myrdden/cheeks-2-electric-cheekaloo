class RedisService
  def initialize
    @redis = Redis.new(host: 'localhost')
  end

  def fetch(key)
    resp = @redis.get(key)
    if !resp
      @redis.set(key, yield)
    end
    return resp
  end
end
