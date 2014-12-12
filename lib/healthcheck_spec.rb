require "healthcheck_spec/version"

module HealthcheckSpec
  def self.checks=(checks)
    @checks = checks
  end

  def self.checks
    @checks
  end
end
