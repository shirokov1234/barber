require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'


def get_db
		
		return SQLite3::Database.new "barbershop.db"
		
	end


configure do

	db = get_db 
	db.execute 'CREATE TABLE IF NOT EXISTS 
	Users 
	(

	"id" INTEGER PRIMARY KEY AUTOINCREMENT, 
	"Name" TEXT, 
	"Phone" TEXT, 
	"DateStamp" TEXT, 
	"Barber" TEXT, 
	"Color" TEXT
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

    db = get_db
	db.execute "insert into Users 
	(

	name, 
	phone, 
	datestamp, 
	barber, 
	color
	) 
 	values (?, ?, ?, ?, ?)" , [@username, @phone, @datetime, @barber, @color]
 			
 
erb "OK, username is #{@username}, #{@phone}, #{@datetime}, #{@barber}, #{@color}"

	end 
	
	
