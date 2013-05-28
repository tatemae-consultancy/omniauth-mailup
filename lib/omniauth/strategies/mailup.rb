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
      option :provider_ignores_state, true

      # AuthHash data for Omniauth
      uid { raw_info["uid"] } # TODO: Need uid from MailUp
      
      info do
        {
          :name => raw_info["username"],
          :nickname => raw_info["username"],
        }
      end
      
      # Get more information about the user.
      def raw_info
        #@raw_info ||= access_token.get('/API/v1/Rest/ConsoleService.svc/Console/Authentication/Info', {"x-esaccess" => access_token.token}).parsed
        @raw_info = {
          "uid" => 'test',
          "username" => 'test'
        }
      end
    end
  end
end

# Make sure that 'mailup' camelizes properly to 'MailUp'.
OmniAuth.config.add_camelization 'mailup', 'MailUp'