# frozen_string_literal: true

module EasyLlama
  class Client
    class Locations
      class << self
        # Sends a GET request to retrieve all locations.
        #
        # @return [Object] The locations or an error message.
        def all
          response = EasyLlama::Client.send_request(path: '/locations')
          EasyLlama::Client.response_body(response, 'locations')
        end

        # Sends a POST request to create a location.
        #
        # @param location_attributes [Hash] The attributes of the location.
        # @return [Object] The created location or an error message.
        def create(location_attributes = {})
          response = EasyLlama::Client.send_request(path: '/locations', method: :post, body: location_attributes)
          EasyLlama::Client.response_body(response, 'location')
        end
      end
    end
  end
end
