require 'bundler/setup'
require 'sinatra/base'
require 'omniauth-mailup'

class App < Sinatra::Base
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
    "AuthHash: #{request.env['omniauth.auth']}".inspect rescue "No data"
  end

  get '/auth/failure' do
    content_type 'text/plain'
    request.env['omniauth.auth'].to_hash.inspect rescue "No Data"
  end
end

use Rack::Session::Cookie, :secret => ENV['RACK_COOKIE_SECRET']

use OmniAuth::Builder do
  provider :mailup, ENV["MAILUP_CLIENT_ID"], ENV["MAILUP_CLIENT_SECRET"]
end

run App.new