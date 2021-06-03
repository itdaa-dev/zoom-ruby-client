# frozen_string_literal: true

require "test_helper"

class WebinarTest < Minitest::Spec
  it "list webinars" do
    skip
    VCR.use_cassette("webinar") do
      response = Zoom::Api::Webinar.list_webinars(user_id: "develop+test@itdaa.net")
      assert_equal 3, response.total_records
    end
  end

  it "create webinar" do
    skip
    params = {
      "topic": "Test Webinar",
      "type": 5,
      "start_time": Time.now,
      "duration": 60,
      "timezone": "Asia/Seoul",
      "password": "pwyJC36pw=",
      "agenda": "Test Webinar",
      "settings": {
        "host_video": true,
        "panelists_video": true,
        "practice_session": true,
        "mute_upon_entry": false,
        "hd_video": true,
        "approval_type": 0,
        "registration_type": 2,
        "audio": "voip",
        "auto_recording": "cloud",
        "enforce_login": false,
        "close_registration": true,
        "show_share_button": true,
        "allow_multiple_devices": false,
        "registrants_email_notification": true
      }
    }

    response = Zoom::Api::Webinar.create_webinar(user_id: "develop+test@itdaa.net", params: params)
    assert_equal params[:topic], response.topic
  end

  it "get webinar" do
    skip
    params = {
      "topic": "Test Webinar",
    }

    response = Zoom::Api::Webinar.get_webinar(webinar_id: 437659431)
    assert_equal params[:topic], response.topic
  end

  it "get panelists" do
    skip
    response = Zoom::Api::Webinar.get_panelists(webinar_id: 437659431)
    assert_equal response.status, 200
  end

  it "add panelists" do
    skip

    params = {
      panelists: [
        {
          name: "panel",
          email: "panel@test_add_panelists.test"
        }
      ]
    }

    response = Zoom::Api::Webinar.add_panelists(webinar_id: 437659431, params: params)
    assert_equal response.status, 200
  end

  it "add registrant" do
    skip

    params = {
      email: "myemail@mycompany.com",
      first_name: "Mike",
      last_name: "Brown"
    }

    response = Zoom::Api::Webinar.add_registrant(webinar_id: 437659431, params: params)
    assert_equal response.status, 200
  end
end
