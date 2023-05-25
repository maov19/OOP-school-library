# second commit - add factorial method
# Create a method called factorial that takes one argument, an integer N, and returns the factorial for that number.
# The factorial is the multiplication of all integers from 1 to N and has the special case that the factorial of 0 is 1.
# This method only accepts 0 and positive integers, so if a negative integer is given it should raise an exception.
class Solver
  def factorial(num)
    return 'No factorial for negative integers' if num.negative?


    sum = 1
    (1..num).each do |i|
      sum *= i
    end


    sum
  end

  def reverse(string)
    arr = string.chars
    char = arr.length - 1
    reversed = ''

    while char >= 0
      reversed << arr[char]
      char -= 1
    end

    reversed
  end
end

string = Solver.new
p string.reverse('hello')
