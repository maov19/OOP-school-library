require_relative 'helper_spec'

class MockNameable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def correct_name
    name
  end
end

describe CapitalizeDecorator do
  let(:nameable) { MockNameable.new('john doe') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the name returned by the decorated object' do
      expect(decorator.correct_name).to eq('John doe')
    end
  end
end
