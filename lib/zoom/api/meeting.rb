# frozen_string_literal: true

module Zoom # :nodoc:
  module Api
    # meetings
    class Meeting < Client
      class << self
        # List all the meetings that were scheduled for a user (meeting host).
        def list_meetings(user_id:, type: "scheduled", page: 30, page_number: 1)
          params = method(__method__).parameters.map(&:last).map { |p| [p, eval(p.to_s)] }.to_h
          parse(JSON.parse(connection.get("users/#{user_id}/meetings", params).body))
        end

        # Create a meeting for a user.
        def create_meeting(user_id:, params:)
          parse(JSON.parse(connection.post("users/#{user_id}/meetings", params.to_json).body))
        end

        # Retrieve the details of a meeting.
        def get_meeting(meeting_id:)
          parse(JSON.parse(connection.get("meetings/#{meeting_id}").body))
        end

        # Register a participant for a meeting.
        # params : { email: "myemail@mycompany.com", first_name: "Mike" }
        # responses : { "registrant_id"=>"1 ","id"=>1, "topic"=>"test", "start_time"=>"2021-06-30T08:00:00Z", "join_url"=>"https://join_url"}
        # https://marketplace.zoom.us/docs/api-reference/zoom-api/meetings/meetingregistrantcreate
        def add_registrant(meeting_id:, params:)
          parse(JSON.parse(connection.post("meetings/#{meeting_id}/registrants", params.to_json).body))
        end
      end
    end
  end
end
