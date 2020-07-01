require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb 'Can you handle a <a href="/secure/place">secret</a>?'
end

get'/about' do
	erb :about

end

get'/visit' do
	erb :visit

end