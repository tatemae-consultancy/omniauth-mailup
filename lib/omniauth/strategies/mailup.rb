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

      uid { raw_info["id"] }

      info do
        {
          :email => raw_info["email"]
          # and anything else you want to return to your API consumers
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/API/v1/Console/User/Info.json').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'mailup', 'MailUp'