require 'rspec/core'
require 'healthcheck_spec'
require 'ostruct'

check = OpenStruct.new(passes?: false, errors: [], name: 'FailingCheck', message: 'checks the health of the lab')
HealthcheckSpec.checks = [ check ]

puts RSpec::Core::Runner.run(['lib/healthcheck_spec/specs.rb'])
