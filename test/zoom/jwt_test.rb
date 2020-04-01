# frozen_string_literal: true

require "test_helper"

class JWTtest < Minitest::Spec
  it "generate_koken" do
    expected_payload = [
      # { "iss" => Zoom.api_key, "exp" => Zoom::JWTAuth::JWT_TOKEN_EXPIRATION_TIME },
      { "iss" => Zoom.api_key, "exp" => Time.now.to_i + 4 * 3600 },
      { "alg"=>"HS256" }
    ]

    token = Zoom::JWTAuth.generate_token
    decoded_token = JWT.decode token, Zoom.api_secret, true, { algorithm: "HS256" }

    assert_equal expected_payload, decoded_token
  end
end
