require 'rspec/core'
require 'healthcheck_spec'
require 'ostruct'
check = OpenStruct.new(passed?: true)
HealthcheckSpec.checks = [ check ]
puts RSpec::Core::Runner.run(['lib/healthcheck_spec/specs.rb'])
