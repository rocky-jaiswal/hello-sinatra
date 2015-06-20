require 'sinatra'
require 'json'

get '/greet/:name', :provides => :json do
  { greeting: "Hello #{params['name']}!" }.to_json
end
