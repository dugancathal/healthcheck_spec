require 'rspec/core'
require 'healthcheck_spec'
require 'ostruct'

check = OpenStruct.new()
HealthcheckSpec.checks = [ check ]

puts RSpec::Core::Runner.run(['lib/healthcheck_spec/specs.rb'])
