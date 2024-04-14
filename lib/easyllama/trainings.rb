# frozen_string_literal: true

module EasyLlama
  class Client
    # This class provides methods for interacting with the Easy Llama API for trainings.
    class Trainings < Api
      # Sends a GET request to retrieve all trainings.
      #
      # @param page [Integer] The page number.
      # @return [Array] The trainings or an error message.
      def all(page: 1)
        response = send_request(path: '/trainings', body: { page: })

        parse_response!(response, 'trainings')
      end
    end
  end
end
