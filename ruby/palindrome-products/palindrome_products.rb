class Palindromes
  Palindrome = Struct.new(:value, :factors)
  attr_reader :smallest, :largest

  def initialize(max_factor:, min_factor: 1)
    @min_factor = min_factor
    @max_factor = max_factor
    @smallest = Palindrome.new(max_factor ** 2, [])
    @largest = Palindrome.new(min_factor ** 2, [])
  end

  def generate
    (@min_factor..@max_factor).to_a.repeated_combination(2).each do |factors|
      product = factors.reduce(&:*)
      next unless product.to_s.palindrome?
      if product < @smallest.value
        @smallest = Palindrome.new(product, [factors])
      elsif product == @smallest.value
        @smallest.factors << factors
      elsif product == @largest.value
        @largest.factors << factors
      elsif product > @largest.value
        @largest = Palindrome.new(product, [factors])
      end
    end
  end

end

class String
  def palindrome?
    self.eql? reverse
  end
end