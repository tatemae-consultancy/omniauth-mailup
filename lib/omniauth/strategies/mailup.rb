require 'omniauth-oauth2'
require 'multi_json'
require 'multi_xml'

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
      uid { raw_info["UID"] } # TODO: Need uid from MailUp
      
      info do
        {
          :company => raw_info["Company"],
          :nickname => raw_info["Username"],
          :is_trial => raw_info["IsTrial"]
        }
      end
      
      # Get more information about the user.
      def raw_info
        req = access_token.get('/API/v1/Rest/ConsoleService.svc/Console/Authentication/Info')
        @raw_info ||= MultiXml.parse(req.body)["ConsoleCurrentAuthenticatedUserInfo"]
      end
    end
  end
end

# Make sure that 'mailup' camelizes properly to 'MailUp'.
OmniAuth.config.add_camelization 'mailup', 'MailUp'