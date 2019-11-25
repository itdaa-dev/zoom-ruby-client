# Zoom Ruby Client

The Zoom Client for Ruby. Provides both resource oriented interfaces and API clients for Zoom services.

## Links of Interest

* [Zoom API Docs](https://marketplace.zoom.us/docs/guides)
* [Changelog](https://github.com/kimsuelim/naver-sdk-ruby/blob/master/CHANGELOG.md)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zoom-ruby-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zoom-ruby-client

## Usage

### Configuration

Before making requests, you must configure the gem with your JWT key
and secret. If you are using Rails, you can do this in an initializer.

```ruby
Zoom.configure do |config|
  config.api_key = "YOUR API KEY"
  config.api_secret = "YOUR API SECRET"
  config.timeout = 10
  config.debug = false
end
```

### API
```ruby
* Zoom::Api::Meeting.list_meetings(user_id: "api_only@itdaa.net")
* Zoom::Api::Meeting.create_meeting(user_id: "api_only@itdaa.net", params: params)
* Zoom::Api::Meeting.get_meeting(meeting_id: 437659431)
* Zoom::Api::User.list_users
* Zoom::Api::User.create_user(params: params)
* Zoom::Api::User.get_user(user_id: "api_only+4@itdaa.net")
* Zoom::Api::User.update_user(user_id: "api_only+4@itdaa.net", params: params)
* Zoom::Api::User.delete_user(user_id: "api_only+4@itdaa.net", params: params)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/zoom-ruby-client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Zoom::Ruby::Client project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/zoom-ruby-client/blob/master/CODE_OF_CONDUCT.md).
