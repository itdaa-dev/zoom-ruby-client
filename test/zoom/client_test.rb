# frozen_string_literal: true

require "test_helper"

class Zoom::ClientTest < Minitest::Test
  def test_that_it_has_a_version_number
    assert_equal "0.4.2", ::Zoom::VERSION
  end
end
