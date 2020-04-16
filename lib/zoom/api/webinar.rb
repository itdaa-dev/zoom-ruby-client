# frozen_string_literal: true

module Zoom # :nodoc:
  module Api
    # webinars
    class Webinar < Client
      class << self
        # List all the webinars that were scheduled for a user (webinar host).
        def list_webinars(user_id:, type: "scheduled", page: 30, page_number: 1)
          params = method(__method__).parameters.map(&:last).map { |p| [p, eval(p.to_s)] }.to_h
          parse(JSON.parse(connection.get("users/#{user_id}/webinars", params).body))
        end

        # Create a webinar for a user.
        def create_webinar(user_id:, params:)
          parse(JSON.parse(connection.post("users/#{user_id}/webinars", params.to_json).body))
        end

        # Retrieve the details of a webinar.
        def get_webinar(webinar_id:)
          parse(JSON.parse(connection.get("webinars/#{webinar_id}").body))
        end
      end
    end
  end
end
