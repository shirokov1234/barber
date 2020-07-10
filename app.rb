require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'


configure do 
	@db = SQLite3::Database.new "barbershop.db"
	@db.execute 'CREATE TABLE IF NOT EXISTS 
	"Users" 
	(

	"id" INTEGER PRIMARY KEY AUTOINCREMENT, 
	"Name" VARCHAR, 
	"Phone" INTEGER, 
	"DateStamp" INTEGER, 
	"Barber" VARCHAR, 
	"Color" VARCHAR
	)'
end  

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

 hh = {:username => 'Введите имя',
 		:phone => 'Введите телефон',
 		:datetime => 'Введите дату и время'}

 		@error = hh.select {|key,_| params[key] == ""}.values.join(",")
 		
 		if @error !=''
 			return erb :visit
 			end
 			
 
erb "OK, username is #{@username},#{@phone},#{@datetime},#{@barber}, #{@color}"

	end 
