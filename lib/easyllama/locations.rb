# frozen_string_literal: true

module EasyLlama
  class Client
    # This class provides methods for interacting with the Easy Llama API for locations.
    class Locations < Api
      # Sends a GET request to retrieve all locations.
      #
      # @param page [Integer] The page number.
      # @return [Array] The locations or an error message.
      def all(page:)
        response = send_request(path: '/locations', body: { page: })

        parse_response!(response, 'locations')
      end

      # Sends a POST request to create a location.
      #
      # @param location_attributes [Hash] The attributes of the location.
      # @return [Object] The created location or an error message.
      def create(location_attributes = {})
        response = send_request(path: '/locations', method: :post, body: location_attributes)

        parse_response!(response, 'location')
      end
    end
  end
end
