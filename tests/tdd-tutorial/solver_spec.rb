require 'rspec'
require_relative 'solver'

describe Solver do
  describe '#factorial' do
    it 'returns 120' do
      five = Solver.new
      expect(five.factorial(5)).to eq(120)
    end
    it 'returns "No factorial for negative integers"' do
      negative = Solver.new
      expect(negative.factorial(-1)).to eq('No factorial for negative integers')
    end
  end
  describe '#reverse' do
    it 'returns "olleh"' do
      string = Solver.new
      expect(string.reverse('hello')).to eq('olleh')
    end
  end
end
