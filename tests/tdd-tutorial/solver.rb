# second commit - add factorial method
# Create a method called factorial that takes one argument, an integer N, and returns the factorial for that number.
# The factorial is the multiplication of all integers from 1 to N and has the special case that the factorial of 0 is 1.
# This method only accepts 0 and positive integers, so if a negative integer is given it should raise an exception.
class Solver
    def factorial(n)
        if n < 0
            return "No factorial for negative integers"
        else
            sum = 1
            for i in 1..n do
                sum *= i
            end
        end
        sum
    end
  end

  number = Solver.new
  p number.factorial(-1)
  