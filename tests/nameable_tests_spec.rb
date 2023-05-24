require_relative 'helper_spec'

class SampleClass < Nameable
end

describe Nameable do
  let(:nameable) { SampleClass.new }

  describe '#correct_name' do
    it 'raises NotImplementedError' do
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
