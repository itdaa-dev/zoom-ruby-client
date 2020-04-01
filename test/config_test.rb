# frozen_string_literal: true

require "test_helper"

class ConfigTest < Minitest::Test
  def test_must_configure_the_gem_with_your_api_key_and_api_secret
    assert_equal "JFcTaawQQ2WaFFT0OVX3GQ", Zoom.api_key
    assert_equal "a9ZduoNHEPPMPHafUEcs4imGtpeivqj48je5", Zoom.api_secret
    refute Zoom.debug
  end
end
