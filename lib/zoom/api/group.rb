# frozen_string_literal: true

module Zoom # :nodoc:
  module Api
    # groups
    class Group < Client
      class << self
        # List groups under an account.
        def list_groups
          parse(JSON.parse(connection.get("groups").body))
        end

        # Add members to a group under your account.
        def add_group_member(group_id:, params:)
          parse(JSON.parse(connection.post("groups/#{group_id}/members", params.to_json).body))
        end
      end
    end
  end
end
