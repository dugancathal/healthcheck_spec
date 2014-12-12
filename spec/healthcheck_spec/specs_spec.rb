require 'ostruct'
require 'healthcheck_spec'
require 'tempfile'

describe 'Healthcheck Specs' do
  def captured_output_from(command)
    `#{command} 2>&1`
  end

  context 'with a valid healthcheck class' do
    let(:spec) do
      'ruby spec/healthcheck_spec/run_one_check.rb'
    end

    it 'runs the checks for each defined healthcheck' do
      expect(captured_output_from(spec)).to match(/5 examples, 0 failures/)
    end

    it 'prints valid documentation format' do
      expect(captured_output_from(spec)).to match(/Passing Check.+checks the health of the lab/m)
    end
  end

  context 'with an invalid healthcheck class' do
    let(:spec) do
      'ruby spec/healthcheck_spec/run_invalid_check_class.rb'
    end

    it 'shows a failure when a check does not implement name' do
      expect(captured_output_from(spec)).to include('it { should respond_to :name }')
    end

    it 'shows a failure when a check does not implement errors' do
      expect(captured_output_from('ruby spec/healthcheck_spec/run_invalid_check_class.rb')).to include('it { should respond_to :errors }')
    end

    it 'shows a failure when a check does not implement message' do
      expect(captured_output_from('ruby spec/healthcheck_spec/run_invalid_check_class.rb')).to include('it { should respond_to :message }')
    end

    it 'shows a failure when a check does not implement passes?' do
      expect(captured_output_from('ruby spec/healthcheck_spec/run_invalid_check_class.rb')).to include('it { should respond_to :passes? }')
    end
  end

  context 'with a failing healthcheck' do
    let(:spec) do
      'ruby spec/healthcheck_spec/run_failing_check.rb'
    end

    it 'shows a readable failure when a check fails' do
      expect(captured_output_from(spec)).to include('expected that FailingCheck would pass, but it failed because:')
    end
  end
end
