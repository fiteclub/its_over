require 'sinatra'
require 'yaml'

if defined?ENV['MAPBOX_API'].nil?
  $apikey = YAML.load_file(".config")["mapbox-pk"]
else
  $apikey = ENV['MAPBOX_API']
end

get '/' do
  erb :index
end

get '/about' do
  erb :about
end

get '/its_over' do
  erb :its_over
end
