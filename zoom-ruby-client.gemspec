# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "zoom/version"

Gem::Specification.new do |spec|
  spec.name          = "zoom-ruby-client"
  spec.version       = Zoom::VERSION
  spec.authors       = ["Surim Kim"]
  spec.email         = ["kimsuelim@gmail.com"]

  spec.summary       = "Zoom Ruby Client"
  spec.description   = "The Zoom Client for Ruby. Provides both resource oriented interfaces and API clients for Zoom services."
  spec.homepage      = "https://github.com/kimsuelim/zoom-ruby-client"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/kimsuelim/zoom-ruby-client"
  spec.metadata["changelog_uri"] = "https://github.com/kimsuelim/zoom-ruby-client/changelog"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 1.1"
  spec.add_dependency "jwt"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "rubocop-minitest"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "codecov"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "overcommit"
end
