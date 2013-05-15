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

In Rails, you'll want to add to the middleware stack:

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
  :credentials => {
    :token => 'adsf456lkj758klfdsg' # OAuth 2.0 access_token. Store and use to authenticate API requests.
  }
}
```