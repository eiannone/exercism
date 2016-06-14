class PrimeFactors
  def self.for(num)
    divisor = 2
    divisors = []
    while num > 1
      until num % divisor == 0
        divisor += 1
      end
      divisors << divisor
      num /= divisor
    end
    divisors
  end
end
