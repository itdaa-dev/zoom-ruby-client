# frozen_string_literal: true

require "test_helper"

class ConnectionTest < Minitest::Spec
  it "initilize connection" do
    connection = Zoom::Client.connection
    assert_equal "JFcTaawQQ2WaFFT0OVX3GQ", connection.instance_variable_get(:@api_key)
    assert_equal "a9ZduoNHEPPMPHafUEcs4imGtpeivqj48je5", connection.instance_variable_get(:@api_secret)
    assert_equal "https://api.zoom.us/v2", connection.instance_variable_get(:@api_base_uri)
  end
end
