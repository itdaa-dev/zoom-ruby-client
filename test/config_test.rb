# frozen_string_literal: true

require "test_helper"

class ConfigTest < Minitest::Test
  def test_must_configure_the_gem_with_your_api_key_and_api_secret
    assert_equal "iB_y5bWPSJ6Pg_x_FYzb2A", Zoom.api_key
    assert_equal "QQbbUzHo8JW4xJczRQhPBSNUmwaBML0jBOhU", Zoom.api_secret
    refute Zoom.debug
  end
end
