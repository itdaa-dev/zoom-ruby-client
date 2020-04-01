# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "zoom"

require "simplecov"
SimpleCov.start

require "minitest/autorun"
require "minitest/pride"
require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "test/cassettes"
  c.hook_into :faraday
end

Zoom.configure do |config|
  config.api_key = "JFcTaawQQ2WaFFT0OVX3GQ"
  config.api_secret = "a9ZduoNHEPPMPHafUEcs4imGtpeivqj48je5"
  config.timeout = 10
  config.debug = false
end
