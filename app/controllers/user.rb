get '/users' do
  response_html = "<h1>Users</h1><ul>"
  User.all.each { |user| response_html << "<li>#{user.name}</li>" }
  response_html << "</ul>"
  response_html
end

get '/users/:id' do
  <<-HTML
  <h1>#{User.find(params[:id]).name}'s Page</h1>
  HTML
end

get '/users/create' do
  <<-HTML
  <form action="/users" method="post">
    <input type="text" name="name" placeholder="Enter name here...">
    <input type="password" name="password" placeholder="Enter password here...">
    <input type="submit">
  </form>
  HTML
end

post '/users' do
  user = User.new(params)
  if user.valid?
    user.save
    redirect '/users/#{user.id}'
  else
    redirect '/users/create'
  end
end

delete '/users/:id' do
  user = User.find(params[:id])
  user.destroy
  redirect '/users'
end

put '/users/:id' do
  user = User.find(params[:id])
  user[:name] = params[:name]
  user[:password] = params[:password]
  redirect '/users/#{params[:id]}'
end
