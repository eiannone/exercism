class PerfectNumber
  def self.classify(num)
    raise RuntimeError unless num > 0
    {-1 => 'deficient', 1 => 'abundant', 0 => 'perfect'}[divisors_sum(num) <=> num]
  end

  private
  def self.divisors_sum(num)
    (1..num / 2).select { |n| num % n == 0}.reduce(:+)
  end
end

module BookKeeping
  VERSION = 1
end