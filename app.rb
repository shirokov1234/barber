require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb 'Can you handle a <a href="/secure/place">secret</a>?'
end

get'/about' do
	@error = "Что-то пошло не поплану!"
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

 if @username == ''
 	 @error = "Введите имя"
 end

 if @phone == ''
 	 @error = "Введите номер телефона"
 end

 if @datetime == ''
 	 @error = "Не верная дата"
 end

 if @error != ''
 		return erb :visit
 	end

erb "OK, username is #{@username},#{@phone},#{@datetime},#{@barber}, #{@color}"

	end 
