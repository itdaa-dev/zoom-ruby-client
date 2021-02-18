# frozen_string_literal: true

module Zoom # :nodoc:
  module Api
    # reports
    class Report < Client
      class << self
        # Retrieve participants of a meeting.
        def get_meeting_participants(meeting_id:, page_size: 300)
          params = method(__method__).parameters.map(&:last).map { |p| [p, eval(p.to_s)] }.to_h
          parse(JSON.parse(connection.get("report/meetings/#{meeting_id}/participants", params).body))
        end

        # Retrieve participants of a webinar.
        def get_webinar_participants(webinar_id:, page_size: 300)
          params = method(__method__).parameters.map(&:last).map { |p| [p, eval(p.to_s)] }.to_h
          parse(JSON.parse(connection.get("report/webinars/#{webinar_id}/participants", params).body))
        end
      end
    end
  end
end
