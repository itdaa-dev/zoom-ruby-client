# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "zoom"

require "simplecov"
SimpleCov.start

require "minitest/autorun"
require "minitest/pride"

Zoom.configure do |config|
  config.api_key = "iB_y5bWPSJ6Pg_x_FYzb2A"
  config.api_secret = "QQbbUzHo8JW4xJczRQhPBSNUmwaBML0jBOhU"
  config.timeout = 10
  config.debug = false
end
