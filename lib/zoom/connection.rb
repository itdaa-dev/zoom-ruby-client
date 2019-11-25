# frozen_string_literal: true

module Zoom
  class Connection
    # Create a Connection object.
    def initialize
      @api_key = Zoom.api_key
      @api_secret = Zoom.api_secret
      @jwt_token = Zoom::JWTAuth.generate_token
      @api_base_uri = Configuration::DEFAULT_API_BASE_URI
      @headers = { user_agent: Configuration::DEFAULT_USER_AGENT }
      @connection = Faraday.new(url: @api_base_uri, headers: @headers) do |faraday|
        # faraday.request :multipart
        faraday.request :url_encoded
        faraday.response :logger if Zoom.debug
        faraday.adapter :net_http
      end
    end

    # Perform a GET request.
    # @param path [String] The path at which to make ther request.
    # @param params [Hash] A hash of request parameters.
    def get(path, params = {})
      request(:get, path, params)
    end

    # Perform a PUT request.
    # @param path [String] The path at which to make ther request.
    # @param params [Hash] A hash of request parameters.
    def put(path, params = {})
      request(:put, path, params)
    end

    # Perform a patch request.
    # @param path [String] The path at which to make ther request.
    # @param params [Hash] A hash of request parameters.
    def patch(path, params = {})
      request(:patch, path, params)
    end

    # Perform a POST request.
    # @param path [String] The path at which to make ther request.
    # @param params [Hash] A hash of request parameters.
    def post(path, params = {})
      request(:post, path, params)
    end

    # Perform a DELETE request.
    # @param path [String] The path at which to make ther request.
    # @param params [Hash] A hash of request parameters.
    def delete(path, params = {})
      request(:delete, path, params)
    end

    private
      def request(verb, path, params = {})
        raise ArgumentError.new "Invalid http verb #{verb}" unless [:get, :post, :put, :patch, :delete].include?(verb)

        response = @connection.run_request(verb, path, params, auth_header) do |request|
          request.params.update(params) if [:get, :delete].include?(verb) && params
          request.headers["Content-Type"] = "application/json" if [:post, :put, :patch].include?(verb)
          yield(request) if block_given?
        end

        unless (200..299).include?(response.status)
          body = JSON.parse(response.body)
          raise Zoom::Error.new(body)
        end

        response
      end

      def auth_header
        {
          "authorization" => "Bearer #{@jwt_token}",
          # "type" => "application/json",
          # "Content-Type" => "application/json"
        }
      end
  end
end
