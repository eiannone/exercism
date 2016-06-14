class SumOfMultiples
  def initialize(*numbers)
    @multiples_of = numbers
  end

  def to(number)
    @multiples_of.inject([]) { |a, num| a + (num...number).step(num).to_a }.uniq.reduce(0, :+)
  end
end