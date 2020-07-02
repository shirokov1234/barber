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

get'/contacts' do
	erb :contacts

end

post "/visit" do

	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

erb "OK, username is #{@username},#{@phone},#{@datetime},#{@barber}, #{@color}"

	end 
