# frozen_string_literal: true

require "test_helper"

class BillingTest < Minitest::Spec
  it "Get Billing Information" do
    VCR.use_cassette("get_billing_information") do
      response = Zoom::Api::Billing.get_billing_information(account_id: 51557038)
      assert_equal "잇다", response.first_name
    end
  end
end
