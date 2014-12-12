RSpec::Matchers.define :pass do
  match do |actual|
    actual.passes?
  end

  failure_message do |actual|
    <<-MSG.lines.map(&:strip).join("\n")
      expected that #{actual.name} would pass, but it failed because:
        #{actual.errors.join("\n  ")}
    MSG
  end
end

RSpec.describe 'Healthchecks' do
  HealthcheckSpec.checks.each do |check|
    context check.name do
      subject { check }
      it { should respond_to :name }
      it { should respond_to :message }
      it { should respond_to :passes? }
      it { should respond_to :errors }
      it check.message do
        expect(check).to pass
      end
    end
  end
end
