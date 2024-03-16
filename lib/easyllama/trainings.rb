# frozen_string_literal: true

module EasyLlama
  class Client
    class Trainings
      class << self
        # Sends a GET request to retrieve all trainings.
        #
        # @return [Object] The trainings or an error message.
        def all
          response = EasyLlama::Client.send_request(path: '/trainings')
          EasyLlama::Client.response_body(response, 'trainings')
        end
      end
    end
  end
end
