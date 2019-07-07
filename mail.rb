require 'sinatra'

get '/' do
  erb :index
end

post  '/' do

  @name = params[:client_name]
  @date = params[:client_date]
  @time = params[:client_time]

  f = File.open 'users.txt', 'a'
  f.write "User: #{@name}, date: #{@date}, time: #{@time}.\n"
  f.close

  erb :success_an_appointment

end

post  '/admin'  do

  @admin_name = params[:admin_name]
  @admin_password = params[:admin_password]

  if @admin_name == 'admin' && @admin_password == '12345'
  @file = File.open"users.txt", "r"
  erb :result
  else
  @fail_message = 'Uncorrect password! '
  erb :admin
end
end

get '/admin' do
  erb :admin
end
