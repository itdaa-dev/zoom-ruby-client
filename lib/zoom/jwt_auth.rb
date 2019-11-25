# frozen_string_literal: true

require "jwt"

module Zoom # :nodoc:
  # Generating JWT for Testing
  class JWTAuth
    JWT_TOKEN_EXPIRATION_TIME = 604800 # 1.weeks.to_i

    class << self
      def generate_token
        hmac_secret = Zoom.api_secret
        payload = {
          "iss": Zoom.api_key,
          "exp": Time.now.to_i + 4 * 3600
        }

        JWT.encode payload, hmac_secret, "HS256"
      end
    end
  end
end
