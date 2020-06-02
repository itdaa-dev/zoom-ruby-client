# frozen_string_literal: true

require "test_helper"

class Zoom::Api::UserSettingsTest < Minitest::Spec
  it "update user settings" do
    params = {
      "feature": {
        "webinar": true
      }
    }

    # "IDQTPFxpQXySoG4LQam7QQ"
    VCR.use_cassette("user_settings_update") do
      response = Zoom::Api::User.update_user_settings(user_id: "develop+test@itdaa.net", params: params)
      assert_equal response.status, 204
    end
  end

  it "get user settings" do
    VCR.use_cassette("get_user_settings") do
      # "IDQTPFxpQXySoG4LQam7QQ"
      response = Zoom::Api::User.get_user_settings(user_id: "develop+test@itdaa.net")
      assert response.feature
      refute response.feature.webinar
    end
  end
end
