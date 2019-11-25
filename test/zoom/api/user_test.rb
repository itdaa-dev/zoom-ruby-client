# frozen_string_literal: true

require "test_helper"

class Zoom::Api::UserTest < Minitest::Spec
  it "list users" do
    response = Zoom::Api::User.list_users
    assert_equal 6, response.total_records
  end

  it "create user" do
    params = {
      "action": "custCreate",
      "user_info": {
        "email": "api_only+4@itdaa.net",
        "type": 1,
        "first_name": "API",
        "last_name": "Only",
        "password": "kpRp6j1mgG+FBn6aYx1K3g=="
      }
    }

    response = Zoom::Api::User.create_user(params: params)
    assert_equal "API", response.first_name
  end

  it "get user" do
    # "IDQTPFxpQXySoG4LQam7QQ"
    response = Zoom::Api::User.get_user(user_id: "api_only+4@itdaa.net")
    assert_equal "API", response.first_name
  end

  it "update user" do
    params = {
      "type": "1"
    }

    # "IDQTPFxpQXySoG4LQam7QQ"
    response = Zoom::Api::User.update_user(user_id: "api_only+4@itdaa.net", params: params)
    assert_equal "API", response.first_name
  end

  it "delete user" do
    params = {
      "action": "delete"
    }

    # "IDQTPFxpQXySoG4LQam7QQ"
    response = Zoom::Api::User.delete_user(user_id: "api_only+4@itdaa.net", params: params)
    assert_equal "API", response
  end
end
