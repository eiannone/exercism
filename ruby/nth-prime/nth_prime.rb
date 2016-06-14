class Prime
  def self.nth(n)
    raise ArgumentError if n < 1
    primes = [2]
    while (n -= 1) > 0
      num = primes.last + 1
      num += 1 while num % 2 == 0 || primes.take_while{ |x| x**2 <= num}.any? { |p| num % p == 0 }
      primes << num
    end
    primes.last
  end
end