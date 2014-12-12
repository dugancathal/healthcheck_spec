# HealthcheckSpec

A quick attempt to write an RSpec-based contract for healthchecks.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'healthcheck_spec'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install healthcheck_spec

## Usage

Somewhere, define some healthcheck classes. Those must conform to an interface
like:

    class MyHealthcheck
      def name
        'My Web App Healthcheck'
      end

      def message
        # This fits into the RSpec `it` syntax
        'checks the health of my web app'
      end

      def passed?
        # Some fancy logic here
        true
      end

      def errors
        # An array of errors (or reasons the healthcheck failed)
        ['it was not running']
      end
    end

Then, in a spec helper (or some place like that, add:

    require 'healthcheck_spec/specs'

## Contributing

1. Fork it ( https://github.com/dugancathal/healthcheck_spec/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
