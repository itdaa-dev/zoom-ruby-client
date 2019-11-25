# frozen_string_literal: true

require "test_helper"

class MeetingTest < Minitest::Spec
  it "list meetings" do
    response = Zoom::Api::Meeting.list_meetings(user_id: "api_only@itdaa.net")
    assert_equal 5, response.total_records
  end

  it "create meeting" do
    params = {
      "topic": "itdaa video chat",
      "type": 2,
      "start_time": Time.now,
      "duration": 40,
      "timezone": "Asia/Seoul",
      "password": "pwyJC36pw=",
      "agenda": "online mentoring",
      "settings": {
        "host_video": true,
        "participant_video": true,
        "join_before_host": false,
        "mute_upon_entry": false,
        "audio": "voip",
        "auto_recording": "cloud"
      }
    }

    response = Zoom::Api::Meeting.create_meeting(user_id: "api_only@itdaa.net", params: params)
    assert_equal params[:topic], response.topic
  end

  it "get meeting" do
    params = {
      "topic": "itdaa video chat",
    }

    response = Zoom::Api::Meeting.get_meeting(meeting_id: 437659431)
    assert_equal params[:topic], response.topic
  end
end
