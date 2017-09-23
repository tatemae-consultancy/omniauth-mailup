require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class MailUp < OmniAuth::Strategies::OAuth2
      
      option :name, :mailup

      option :client_options, {
        site: "https://services.mailup.com",
        authorize_url: "/Authorization/OAuth/LogOn",
        token_url: "/Authorization/OAuth/Token"
      }
      
      # TODO: Do we need this?
      option :provider_ignores_state, true

      # AuthHash data for Omniauth
      uid { raw_info["UID"] } # TODO: Need uid from MailUp
      
      info do
        {
          company: raw_info["Company"],
          nickname: raw_info["Username"],
          version: raw_info["Version"],
          is_trial: raw_info["IsTrial"]
        }
      end

      # We need to ovveride this method because with the default one the 
      # callback_urls are different between the request phase and the 
      # callback phases (the query string is added)
      #
      # Based on the OAuth specification if the redirect_uri is give during the
      # request phase the same uri must be given during the callback phase 
      def callback_url
        full_host + script_name + callback_path
      end
      
      # Get more information about the user.
      def raw_info
        @raw_info ||= access_token.get('/API/v1.1/Rest/ConsoleService.svc/Console/Authentication/Info').parsed
      end
    end
  end
end

# Make sure that 'mailup' camelizes properly to 'MailUp'.
OmniAuth.config.add_camelization 'mailup', 'MailUp'