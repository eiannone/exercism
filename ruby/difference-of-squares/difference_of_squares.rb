class Squares
  def initialize(n)
    @n = n
  end

  def square_of_sum
    @squares_sum ||= (@n * (@n + 1) / 2) **2
  end

  def sum_of_squares
    @sum_squares ||= (1..@n).inject(0) { |sum, i| sum + i**2 }
  end

  def difference
    @difference ||= square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 3
end