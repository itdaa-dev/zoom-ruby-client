# frozen_string_literal: true

require "test_helper"

class ConnectionTest < Minitest::Spec
  it "initilize connection" do
    connection = Zoom::Client.connection
    assert_equal "iB_y5bWPSJ6Pg_x_FYzb2A", connection.instance_variable_get(:@api_key)
    assert_equal "QQbbUzHo8JW4xJczRQhPBSNUmwaBML0jBOhU", connection.instance_variable_get(:@api_secret)
    assert_equal "https://api.zoom.us/v2", connection.instance_variable_get(:@api_base_uri)
  end
end
