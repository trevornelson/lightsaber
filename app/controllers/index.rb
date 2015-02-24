require 'sinatra'
require 'pony'

get '/' do
  <<-HTML
  <h1>Trevor Nelson</h1>
  <ul>
    <li><a href="/city/astoria">Where Trevor lives.</a></li>
    <li><a href="/projects/portfolio-site">Project: trevornelson.github.io</a></li>
    <li><a href="/projects/squeeklights-site">Project: squeeklights.com</a></li>
    <li><a href="/contact">Email me.</a></li>
  </ul>
  HTML
end

get '/city/:city_name' do
  <<-HTML
  <h1>#{params[:city_name]}'s Pretty Great!</h1>
  <a href='https://www.google.com/#q=#{params[:city_name]}'>Find more info about #{params[:city_name]}.</a>
  HTML
end

get '/projects/:project_name' do
  page_content =
  case params[:project_name]
  when 'portfolio-site' then {title: "My Portfolio Site", url: "http://trevornelson.github.io"}
  when 'squeeklights-site' then {title: "Squeek Lights Site", url: "http://www.squeeklights.com"}
  end

  <<-HTML
  <h1>#{page_content[:title]}</h1>
  <a href='#{page_content[:url]}'>Link</a><br>
  <iframe src='#{page_content[:url]}' width="1200" height="1200"></iframe>
  HTML
end

get '/contact' do
  <<-HTML
  <h1>Get in touch.</h1>
  <form action="/contact" method="POST">
    <label>
      Your Email Address:
      <input type="text" name="email">
    </label>
    <label>
      Subject:
      <input type="text" name="subject">
    </label>
    <label>
      Message:
      <input type="text" name="body">
    </label>
    <input type="submit">
  </form>
  HTML
end

post '/contact' do
  Pony.mail :to => 'trevor.nelson1@gmail.com',
            :from => params[:email],
            :subject => params[:subject],
            :body => params[:body]
end
