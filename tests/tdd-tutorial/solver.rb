class Solver
  def factorial(number)
    return 'No factorial for negative integers' if number.negative?

    sum = 1
    (1..number).each do |i|
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

  def fizzbuzz(number)
    return 'fizzbuzz' if (number % 3).zero? && (number % 5).zero?
    return 'fizz' if (number % 3).zero?
    return 'buzz' if (number % 5).zero?

    number.to_s
  end
end

solver = Solver.new
reversed_string = solver.reverse('hello')
puts reversed_string
