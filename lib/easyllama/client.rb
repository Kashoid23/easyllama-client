# frozen_string_literal: true

require 'net/http'
require 'json'

require_relative 'api'
require_relative 'oauth'
require_relative 'locations'
require_relative 'learners'
require_relative 'trainings'

module EasyLlama
  # This class provides methods for interacting with the Easy Llama API interface.
  class Client
    class << self
      attr_accessor :api_token

      def locations
        Locations.new(api_token)
      end

      def learners
        Learners.new(api_token)
      end

      def trainings
        Trainings.new(api_token)
      end

      def learner_trainings
        LearnerTrainings.new(api_token)
      end
    end
  end
end
