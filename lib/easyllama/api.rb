# frozen_string_literal: true

module EasyLlama
  class Client
    # This class provides methods for interacting with the Easy Llama API.
    class Api
      DEFAULT_URI_BASE = 'https://api.easyllama.com/api/'
      DEFAULT_API_VERSION = 'v1'

      # Initializes the API client.
      #
      # @param token [String] The token.
      # @return [String] The token.
      def initialize(token)
        @token = token

        super()
      end

      # Sends an HTTP request to the specified path.
      #
      # @param path [String] The path of the API endpoint.
      # @param method [Symbol] The HTTP method (:get, :post, :put, :patch, :delete).
      # @param body [Hash] The request body (optional).
      # @return [Net::HTTPResponse] The HTTP response.
      def send_request(path: nil, method: :get, body: nil)
        raise ArgumentError, 'Please provide EasyLlama::Client.api_token' if @token.nil?

        uri = build_uri(path)
        request = build_request(uri, method, body)
        execute_request(uri, request)
      end

      # Parses the response body.
      # If the response is successful, returns the value for the key.
      # If the response is unsuccessful, returns an error code and message.
      #
      # @param response [Net::HTTPResponse] The HTTP response.
      # @param key [String] The key to retrieve from the response body.
      # @return [Object] The empty hash, parsed response body, value corresponding to the key or error code and message.
      def parse_response!(response, key = nil)
        if response.is_a?(Net::HTTPSuccess)
          return {} if response.body.nil?
          return JSON.parse(response.body) if key.nil?

          JSON.parse(response.body)[key]
        else
          { 'code' => response.code, 'error' => response.message }
        end
      end

      private

      def build_uri(path)
        URI("#{DEFAULT_URI_BASE}#{DEFAULT_API_VERSION}#{path}")
      end

      def build_request(uri, method, body)
        request = http_method_class(method).new(uri)
        request['content-type'] = 'application/json'
        request['accept'] = 'application/json'
        request['authorization'] = "Bearer #{@token}"
        request.body = body if body.present?
        request
      end

      def execute_request(uri, request)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.request(request)
      end

      def http_method_class(method)
        case method
        when :get then Net::HTTP::Get
        when :post then Net::HTTP::Post
        when :put then Net::HTTP::Put
        when :patch then Net::HTTP::Patch
        when :delete then Net::HTTP::Delete
        else raise ArgumentError, "Http method #{method} not recognized in EasyLlama::Client"
        end
      end
    end
  end
end
