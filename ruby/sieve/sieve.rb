class Sieve
  attr_reader :primes

  def initialize(num)
    @primes = []
    numbers = (2..num).to_a
    until numbers.empty?
      @primes << numbers.shift
      numbers.reject! { |i| i % @primes.last == 0 }
    end
  end
end