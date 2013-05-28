# OmniAuth Mailup

MailUp OAuth2 Strategy for OmniAuth 1.0.

## Installing

Add the strategy to your `Gemfile`:

    gem 'omniauth-mailup'

Then `bundle install`.

## Usage

`OmniAuth::Strategies::MailUp` is simply a Rack middleware. Read the OmniAuth 1.0 docs for detailed instructions: https://github.com/intridea/omniauth.

```ruby
use OmniAuth::Builder do
  provider :mailup, ENV['MAILUP_CLIENT_ID'], ENV['MAILUP_CLIENT_SECRET']
end
```

In Rails, you'll want to add to the middleware stack (`config/initializers/omniauth.rb`):

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :mailup, ENV['MAILUP_CLIENT_ID'], ENV['MAILUP_CLIENT_SECRET']
end
```

## Authentication Hash

Here's an example _Authentication Hash_ available in `request.env['omniauth.auth']`:

```ruby
{
  :provider => 'mailup',
  :uid => '12ab56cd9',
  :info => {
	  :name => 'joepublic',
	  :nickname => 'joepublic'
  },
  :credentials => {
    :token => 'adsf456lkj758klfdsg5634kl',        # OAuth 2.0 access_token.
    :refresh_token => '6l5k37hl345656lh342345lh', # OAuth 2.0 refresh_token.
    :expires => true,
    :expires_at => 1369759346
  }
}
```

## Example

An example Sinatra app is provided in `example/config.ru`. Simply follow these instructions:

```
cd example
bundle
rackup config.ru
```

You can then view the app in your browser at `localhost:9292`.