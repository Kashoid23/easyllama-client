# frozen_string_literal: true

module EasyLlama
  class Client
    # This class provides methods for interacting with the Easy Llama API for learner trainings.
    class LearnerTrainings < Api
      # Sends a GET request to retrieve all learner trainings.
      #
      # @param page [Integer] The page number.
      # @return [Array] The learner trainings or an error message.
      def where(page: 1, learner_id: nil, training_id: nil, status: nil, sort: nil)
        response = send_request(path: '/learner_trainings', body: { page:, learner_id:, training_id:, status:, sort: })

        parse_response!(response, 'learner_trainings')
      end
    end
  end
end
