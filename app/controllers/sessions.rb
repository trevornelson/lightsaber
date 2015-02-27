get '/log-in' do
  @title = "Login"
  params[:errors] == "1" ? @headline = "Sorry, invalid login credentials." : @headline = "Account Login"
  erb :"users/log_in"
end

post '/log-in' do
  @user = User.find_by(name: params[:name])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    redirect "/log-in?errors=1"
  end
end

get '/log-out' do
  session.delete(:user_id)
  redirect "/log-in"
end
