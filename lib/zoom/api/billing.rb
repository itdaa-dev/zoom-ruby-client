# frozen_string_literal: true

module Zoom # :nodoc:
  module Api
    # Billing
    class Billing < Client
      class << self
        # Get Billing Information
        def get_billing_information(account_id:)
          parse(JSON.parse(connection.get("accounts/#{account_id}/billing").body))
        end

        # Get Plan Information
        def get_plan_information(account_id:)
          parse(JSON.parse(connection.get("accounts/#{account_id}/plans").body))
        end

        # Get plan usage
        def get_plan_usage(account_id:)
          parse(JSON.parse(connection.get("accounts/#{account_id}/plans/usage").body))
        end
      end
    end
  end
end
