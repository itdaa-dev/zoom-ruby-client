# frozen_string_literal: true

require "faraday"

require "zoom/version"
require "zoom/jwt_auth"
require "zoom/core_ext/hash/keys"
require "zoom/configuration"
require "zoom/connection"
require "zoom/client"
require "zoom/error"
# require "zoom/oauth"
require "zoom/objectified_hash"

require "zoom/api/billing"
require "zoom/api/user"
require "zoom/api/meeting"
require "zoom/api/webinar"
require "zoom/api/group"

module Zoom
  extend Configuration
end
