# frozen_string_literal: true

module Zoom
  # Defines constants and methods related to configuration.
  module Configuration
    # An array of valid keys in the options hash when configuring a Zoom::Client.
    OPTION_KEYS = [:api_key, :api_secret, :timeout, :debug]

    # The user agent that will be sent to the API endpoint if none is set.
    DEFAULT_USER_AGENT = "Zoom Ruby Client Gem #{Zoom::VERSION}"

    # Base URI for the Zoom API.
    DEFAULT_API_BASE_URI = "https://api.zoom.us/v2"

    # Base URI for Zoom OAuth.
    DEFAULT_OAUTH_BASE_URI = "https://api.zoom.us/v2"

    attr_accessor(*OPTION_KEYS)

    # Convenience method to allow configuration options to be set in a block.
    def configure
      yield(self)
    end

    # Creates a hash of options and their values.
    def options
      options = {}
      OPTION_KEYS.each { |key| options[key] = send(key) }
      options
    end
  end
end
