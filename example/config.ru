require 'rubygems'
require 'bundler'
require 'sinatra'
require 'omniauth'
require 'omniauth-mailup'

get '/' do
  <<-HTML
	<div>
		Your credentials are :
		<ul>
			<li>client id : #{ENV["MAILUP_CLIENT_ID"]}</li>
			<li>secret key : #{ENV["MAILUP_CLIENT_SECRET"]}</li>
		</ul>
	</div>
  <a href='/auth/mailup'>Sign in with MailUp</a>
  HTML
end

get '/auth/:provider/callback' do
  content_type 'text/plain'
	token = request.env['omniauth.auth']['credentials']['token']
  "Access token is #{token}".inspect rescue "No data"
end

get '/auth/failure' do
  content_type 'text/plain'
  request.env['omniauth.auth'].to_hash.inspect rescue "No Data"
end

use Rack::Session::Cookie, :secret => ENV['RACK_COOKIE_SECRET']

use OmniAuth::Builder do
  provider :mailchimp, ENV["MAILUP_CLIENT_ID"], ENV["MAILUP_CLIENT_SECRET"]
end