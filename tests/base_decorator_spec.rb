require 'rspec'
require_relative '../utils/base_decorator'

class MockNameable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def correct_name
    name
  end
end

describe BaseDecorator do
  let(:nameable) { MockNameable.new('John Doe') }
  let(:decorator) { BaseDecorator.new(nameable) }

  describe '#initialize' do
    it 'assigns the nameable object' do
      expect(decorator.instance_variable_get(:@nameable)).to eq(nameable)
    end
  end

  describe '#correct_name' do
    it 'delegates the correct_name method to the nameable object' do
      allow(nameable).to receive(:correct_name).and_return('Mock Correct Name')
      expect(decorator.correct_name).to eq('Mock Correct Name')
    end
  end
end