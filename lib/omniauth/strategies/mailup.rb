require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class MailUp < OmniAuth::Strategies::OAuth2
      
      option :name, :mailup

      option :client_options, {
        :site => "https://services.mailup.com",
        :authorize_url => "/Authorization/OAuth/LogOn",
        :token_url => "/Authorization/OAuth/Token"
      }
      
      # TODO: Do we need this?
      #option :provider_ignores_state, true

      uid { raw_info["id"] }

      info do
        {
          :email => raw_info["email"]
          # TODO: Whatever other info we want to return
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/API/v1/Console/User/Info.json').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'mailup', 'MailUp'