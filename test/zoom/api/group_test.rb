# frozen_string_literal: true

require "test_helper"

class Zoom::Api::GroupTest < Minitest::Spec
  it "get groups" do
    VCR.use_cassette("list_groups") do
      response = Zoom::Api::Group.list_groups
      assert_equal response.total_records, 1
    end
  end

  it "add group members" do
    params = {
      "members": [
        {
          "email": "api_only+4@itdaa.net"
        }
      ]
    }

    VCR.use_cassette("add_group_member") do
      response = Zoom::Api::Group.add_group_member(group_id: "eW5tZnbETTa7DGX7bjRB_g", params: params)
      assert_equal "", response.ids
    end
  end
end
