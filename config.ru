require './app'

configure do
  set :redis, Redis.new(host: 'my-redis')
end

run Sinatra::Application

