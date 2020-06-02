# frozen_string_literal: true

module Zoom # :nodoc:
  module Api
    # users
    class User < Client
      class << self
        # A Zoom account can have one or more users.
        # Use this API to list users on your account.
        def list_users(status: "active", page: 30, page_number: 1)
          params = method(__method__).parameters.map(&:last).map { |p| [p, eval(p.to_s)] }.to_h
          parse(JSON.parse(connection.get("users", params).body))
        end

        # A Zoom account can have one or more users.
        # Use this API to add a new user to your account.
        def create_user(params:)
          parse(JSON.parse(connection.post("users", params.to_json).body))
        end

        # A Zoom account can have one or more users.
        # Use this API to view information of a specific user on a Zoom account.
        def get_user(user_id:)
          parse(JSON.parse(connection.get("users/#{user_id}").body))
        end

        # Update information on a user’s Zoom profile.
        # The user ID or email address of the user.
        def update_user(user_id:, params:)
          connection.patch("users/#{user_id}", params.to_json)
        end

        # Deleting a user permanently removes them and their data from Zoom.
        # They will be able to create a new Zoom account with the same email addressif they have access to it.
        # An account owner or an account admin can transfer meetings, webinars and cloud recordings to another
        # Zoom user before deleting, but if not transferred, they will be permanently deleted.
        def delete_user(user_id:, params:)
          connection.delete("users/#{user_id}", params).body
        end

        # Retrieve a user’s settings.
        def get_user_settings(user_id:)
          parse(JSON.parse(connection.get("users/#{user_id}/settings").body))
        end

        # Update a user’s settings.
        def update_user_settings(user_id:, params:)
          connection.patch("users/#{user_id}/settings", params.to_json)
        end
      end
    end
  end
end
