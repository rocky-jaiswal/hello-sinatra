require './app'

configure do
  #set :redis, Redis.new
end

run Sinatra::Application
