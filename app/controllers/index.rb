get '/' do
  erb :index
end

get '/register.json' do
  erb(:_register, :layout => false)
end

post '/register.json' do
  content_type :json
  if params['email'].match('.+@{1}.+\..+')
    erb(:_success).to_json
  else
    erb(:_error).to_json
  end
end
