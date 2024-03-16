# frozen_string_literal: true

module EasyLlama
  class Client
    # This class provides methods for interacting with the Easy Llama API for learners.
    class Learners
      class << self
        # Sends a GET request to retrieve all learners.
        #
        # @return [Object] The learners or an error message.
        def all
          response = EasyLlama::Client.send_request(path: '/learners')

          EasyLlama::Client.parse_response(response, 'learners')
        end

        # Sends a GET request to retrieve a learner by ID.
        #
        # @param id [Integer] The ID of the learner.
        # @return [Object] The learner or an error message.
        def find(id)
          response = EasyLlama::Client.send_request(path: "/learners/#{id}")

          EasyLlama::Client.parse_response(response, 'learner')
        end

        # Sends a POST request to create a learner.
        #
        # @param learner_attributes [Hash] The attributes of the learner.
        # @return [Object] The created learner or an error message.
        def create(learner_attributes = {})
          response = EasyLlama::Client.send_request(path: '/learners', method: :post, body: learner_attributes)

          EasyLlama::Client.parse_response(response, 'learner')
        end

        # Sends a PATCH request to update a learner by ID.
        #
        # @param id [Integer] The ID of the learner.
        # @param learner_attributes [Hash] The attributes to update.
        # @return [Object] The updated learner or an error message.
        def update(id, learner_attributes = {})
          response = EasyLlama::Client.send_request(path: "/learners/#{id}", method: :patch, body: learner_attributes)

          EasyLlama::Client.parse_response(response, 'learner')
        end

        # Sends a POST request to assign a training to a learner.
        #
        # @param training_id [Integer] The ID of the training.
        # @param learner_id [Integer] The ID of the learner.
        # @return [Object] The training assignment details or an error message.
        def assign_training_to_learner(training_id:, learner_id:)
          response = EasyLlama::Client.send_request(
            path: "/learners/#{learner_id}/learner_trainings",
            method: :post,
            body: { learner_id:, training_id: }
          )

          EasyLlama::Client.parse_response(response)
        end

        # Sends a DELETE request to archive a learner by ID.
        #
        # @param id [Integer] The ID of the learner.
        # @return [Object] The updated learner or an error message.
        def archive(id)
          response = EasyLlama::Client.send_request(path: "/learners/#{id}", method: :delete)

          EasyLlama::Client.parse_response(response)
        end
      end
    end
  end
end
