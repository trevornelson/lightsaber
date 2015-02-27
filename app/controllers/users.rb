## View all users
get '/users' do
  @users = User.all
  html_output = "<h1>View All Users</h1><ul>"
  @users.each do |user|
    html_output << "<li>#{user.name}</li>"
  end
  html_output << "</ul>"
  html_output
end

## View a user's page
get '/users/:id' do
  @user = User.find(params[:id])
  <<-HTML
  <h1>#{@user.name}'s Page</h1>
  HTML
end

# View the create user form
get '/create_user' do
  <<-HTML
  <h1>Create An Account</h1>
  <form action="/users" method="post">
    <label>
      Name:
      <input type="text" name="name">
    </label>
    <label>
      Password:
      <input type="password" name="name">
    </label>
    <input type="submit">
  </form>
  HTML
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
