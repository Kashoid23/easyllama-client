# frozen_string_literal: true

module EasyLlama
  class Client
    # This class provides methods for interacting with the Easy Llama API for OAuth.
    class OAuth < Api
      # Initializes the OAuth client.
      #
      # @param client_id [String] The client ID.
      # @param client_secret [String] The client secret.
      # @return [Object] The Easy Llama API client.
      def initialize(client_id, client_secret)
        access_token = get_access_token(client_id, client_secret)

        EasyLlama::Client.api_token = access_token

        super access_token
      end

      private

      def get_access_token(client_id, client_secret)
        response = send_request(
          path: '/oauth/token',
          method: :post,
          body: {
            client_id:,
            client_secret:,
            grant_type: 'client_credentials'
          }
        )

        parse_response!(response, 'access_token')
      end
    end
  end
end
