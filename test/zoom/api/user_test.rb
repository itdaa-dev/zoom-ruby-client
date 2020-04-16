# frozen_string_literal: true

require "test_helper"

class Zoom::Api::UserTest < Minitest::Spec
  it "list users" do
    VCR.use_cassette("users_list") do
      response = Zoom::Api::User.list_users
      assert_equal 1, response.total_records
    end
  end

  it "update user" do
    params = {
      "first_name": "api",
      "last_name": "test",
      "type": 1
    }

    # "IDQTPFxpQXySoG4LQam7QQ"
    VCR.use_cassette("user_update") do
      response = Zoom::Api::User.update_user(user_id: "develop+test@itdaa.net", params: params)
      assert_equal response.status, 204
    end

    VCR.use_cassette("user_get") do
      response = Zoom::Api::User.get_user(user_id: "develop+test@itdaa.net")
      assert_equal params[:first_name], response.first_name
      assert_equal params[:last_name], response.last_name
      assert_equal params[:type], response.type
    end
  end

  it "create user" do
    skip
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

  it "delete user" do
    skip
    params = {
      "action": "delete"
    }

    # "IDQTPFxpQXySoG4LQam7QQ"
    response = Zoom::Api::User.delete_user(user_id: "api_only+4@itdaa.net", params: params)
    assert_equal "API", response
  end
end
