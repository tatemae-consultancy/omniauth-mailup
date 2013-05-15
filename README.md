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

## License

Copyright (c) 2013 by Brian Getting and MailUp Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
