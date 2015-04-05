require 'sinatra'
require 'json'
#require 'redis'

get '/greet/:name', :provides => :json do
  #settings.redis.incr("greeter_hits")
  { greeting: "Hello #{params['name']}!" }.to_json
end
