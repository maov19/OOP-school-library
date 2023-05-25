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

  def fizzbuzz(n)
    return 'fizzbuzz' if (n % 3).zero? && (n % 5).zero?
    return 'fizz' if (n % 3).zero?
    return 'buzz' if (n % 5).zero?

    n.to_s
  end
end

string = Solver.new
p string.reverse('hello')
