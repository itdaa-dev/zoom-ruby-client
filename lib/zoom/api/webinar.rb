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

        # list all the panelists of a Webinar.
        # {"total_records"=>1, "panelists"=>[{"id"=>"kBEzAe", "name"=>"panel", "email"=>"panel@add_panelists.test", "join_url"=>"https://us02web.zoom.us/**"}]}
        def get_panelists(webinar_id:)
          parse(JSON.parse(connection.get("webinars/#{webinar_id}/panelists").body))
        end

        # add panelists to a scheduled webinar.
        def add_panelists(webinar_id:, params:)
          parse(JSON.parse(connection.post("webinars/#{webinar_id}/panelists", params.to_json).body))
        end

        # Register a participant for a webinar.
        # params : { email: "sjfkghdsg@someemail.dfgjd", first_name: "Jill" }
        # responses : { "registrant_id"=>"1 ","id"=>1, "topic"=>"test", "start_time"=>"2021-06-30T08:00:00Z", "join_url"=>"https://join_url"}
        # https://marketplace.zoom.us/docs/api-reference/zoom-api/webinars/webinarregistrantcreate
        def add_registrant(webinar_id:, params:)
          parse(JSON.parse(connection.post("webinars/#{webinar_id}/registrants", params.to_json).body))
        end
      end
    end
  end
end
