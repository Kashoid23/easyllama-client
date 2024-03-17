# frozen_string_literal: true

module EasyLlama
  class Client
    # This class provides methods for interacting with the Easy Llama API for trainings.
    class Trainings < Api
      # Sends a GET request to retrieve all trainings.
      #
      # @return [Object] The trainings or an error message.
      def all
        response = send_request(path: '/trainings')

        parse_response!(response, 'trainings')
      end
    end
  end
end
