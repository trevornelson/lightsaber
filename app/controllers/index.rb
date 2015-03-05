get '/' do
  erb :index
end

get '/reddit' do
  content_type :json

  return {title: 'mmm so hydrated!', username: 'trevor', content: 'some post content', url: 'www.asite.com', votes: 10}.to_json
end

