require 'sinatra'

get '/' do
  erb :index
end

get '/about' do
  erb :about
end

get '/its_over' do
  erb :its_over
end
