# frozen_string_literal: true

require "test_helper"

class ConfigurationTest < Minitest::Spec
  it "user_agent" do
    assert_equal "Zoom Ruby Client Gem #{Zoom::VERSION}", Zoom::Configuration::DEFAULT_USER_AGENT
  end

  it "api_base_uri" do
    assert_equal "https://api.zoom.us/v2", Zoom::Configuration::DEFAULT_API_BASE_URI
  end

  it "oauth_base_uri" do
    assert_equal "https://api.zoom.us/v2", Zoom::Configuration::DEFAULT_OAUTH_BASE_URI
  end

  it "must configure the gem with your api_key and api_secret" do
    assert_equal "iB_y5bWPSJ6Pg_x_FYzb2A", Zoom.api_key
    assert_equal "QQbbUzHo8JW4xJczRQhPBSNUmwaBML0jBOhU", Zoom.api_secret
    assert_equal 10, Zoom.timeout
    refute Zoom.debug
  end
end
