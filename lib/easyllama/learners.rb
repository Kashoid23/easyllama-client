# frozen_string_literal: true

module EasyLlama
  class Client
    # This class provides methods for interacting with the Easy Llama API for learners.
    class Learners < Api
      # Sends a GET request to retrieve all learners.
      #
      # @return [Object] The learners or an error message.
      def all
        response = send_request(path: '/learners')

        parse_response!(response, 'learners')
      end

      # Sends a GET request to retrieve a learner by ID.
      #
      # @param id [Integer] The ID of the learner.
      # @return [Object] The learner or an error message.
      def find(id)
        response = send_request(path: "/learners/#{id}")

        parse_response!(response, 'learner')
      end

      # Sends a POST request to create a learner.
      #
      # @param learner_attributes [Hash] The attributes of the learner.
      # @return [Object] The created learner or an error message.
      def create(learner_attributes = {})
        response = send_request(path: '/learners', method: :post, body: learner_attributes)

        parse_response!(response, 'learner')
      end

      # Sends a PATCH request to update a learner by ID.
      #
      # @param id [Integer] The ID of the learner.
      # @param learner_attributes [Hash] The attributes to update.
      # @return [Object] The updated learner or an error message.
      def update(id, learner_attributes = {})
        response = send_request(path: "/learners/#{id}", method: :patch, body: learner_attributes)

        parse_response!(response, 'learner')
      end

      # Sends a POST request to assign a training to a learner.
      #
      # @param training_id [Integer] The ID of the training.
      # @param learner_id [Integer] The ID of the learner.
      # @return [Object] The training assignment details or an error message.
      def assign_training_to_learner(training_id:, learner_id:)
        response = send_request(
          path: "/learners/#{learner_id}/learner_trainings",
          method: :post,
          body: { learner_id:, training_id: }
        )

        parse_response!(response)
      end

      # Sends a DELETE request to unassign a training from a learner.
      #
      # @param learner_training_id [Integer] The ID of the learner training.
      # @param learner_id [Integer] The ID of the learner.
      # @return [Object] An error message or an empty hash.
      def unassign_training_from_learner(learner_training_id:, learner_id:)
        response = send_request(
          path: "/learners/#{learner_id}/learner_trainings/#{learner_training_id}",
          method: :delete,
          body: { learner_id:, learner_training_id: }
        )

        parse_response!(response)
      end

      # Sends a DELETE request to archive a learner by ID.
      #
      # @param id [Integer] The ID of the learner.
      # @return [Object] An error message or an empty hash.
      def archive(id)
        response = send_request(path: "/learners/#{id}", method: :delete)

        parse_response!(response)
      end
    end
  end
end
