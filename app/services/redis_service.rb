class RedisService
  def initialize
    @redis = Redis.new
  end

  def fetchex(key, expiry)
    resp = @redis.get(key)
    if !resp
      @redis.setex(key, expiry, yield)
    end
    return resp
  end
end
