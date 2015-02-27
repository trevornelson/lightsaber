## View all users
get '/users' do
  @users = User.all
  erb :'users/index'
end

## View a user's page
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

# View the create user form
get '/create_user' do
  erb :'users/create'
end

## Submit form to create user
post '/users' do
  user = User.create(params)
  redirect "/users/#{user.id}"
end

put '/users' do
  user = User.update(name: params[:name], password: params[:password])
  redirect "/users/#{user.id}"
end
