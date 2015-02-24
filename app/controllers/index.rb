require 'sinatra'

get '/' do
  <<-HTML
<p>
Welcome to my LightSaber.  Prepare to be amazed.
<p>
<a href='/sound'>Hear my swooshy sound!</a>
  HTML
end

get '/sound' do
  <<-HTML
<audio controls>
  <source src="http://soundbible.com/grab.php?id=19&type=wav" type="audio/wav">
  <source src="http://soundbible.com/grab.php?id=19&type=mp3" type="audio/mpeg">
Your browser does not support the audio element.
</audio>
  HTML
end
