require 'rspec'
require_relative 'solver'

describe Solver do
  describe '#factorial' do
    it 'returns 120' do
      five = Solver.new
      expect(five.factorial(5)).to eq(120)
    end

    it 'returns "No factorial for negative integers"' do
      Solver.new
      expect { resolver.factorial(-5) }.to raise_exception
    end
  end

  describe '#reverse' do
    it 'returns "olleh"' do
      string = Solver.new
      expect(string.reverse('hello')).to eq('olleh')
    end
  end

  describe '#fizzbuzz' do
    it 'returns "fizz" for numbers divisible by 3' do
      solver = Solver.new
      expect(solver.fizzbuzz(3)).to(eq('fizz'))
      expect(solver.fizzbuzz(9)).to(eq('fizz'))
    end

    it 'returns "buzz" for numbers divisible by 5' do
      solver = Solver.new
      expect(solver.fizzbuzz(5)).to(eq('buzz'))
      expect(solver.fizzbuzz(10)).to(eq('buzz'))
    end

    it 'returns "fizzbuzz" for numbers divisible by both 3 and 5' do
      solver = Solver.new
      expect(solver.fizzbuzz(15)).to(eq('fizzbuzz'))
      expect(solver.fizzbuzz(30)).to(eq('fizzbuzz'))
    end

    it 'returns the number as a string for other cases' do
      solver = Solver.new
      expect(solver.fizzbuzz(7)).to(eq('7'))
      expect(solver.fizzbuzz(13)).to(eq('13'))
    end
  end
end
