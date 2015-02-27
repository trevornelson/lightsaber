require_relative '../spec_helper'

describe 'Users Controller' do
  it 'responded to a get request to /users' do
    get '/users'
    expect(last_response).to be_ok
  end

  it 'responded to a get request to /users/:id' do
    get '/users/1'
    expect(last_response).to be_ok
  end

  it 'responded to a post request to /users' do
    post '/users'
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response).to be_ok
  end

  it 'responded to a put request to /users/:id' do
    put '/users/:id'
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response).to be_ok
  end

  it 'responded to a delete request to /users/:id' do
    delete '/users'
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response).to be_ok
  end

end
