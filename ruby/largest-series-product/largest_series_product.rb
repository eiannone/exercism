class Series
  def initialize(str)
    raise ArgumentError if str =~ /[\D]/
    @numbers = str.chars.map(&:to_i)
  end

  def largest_product(num)
    return 1 if num.zero?
    raise ArgumentError unless num.between?(1, @numbers.size)
    @numbers.each_cons(num).map { |group| group.reduce(:*) }.max
  end
end

module BookKeeping
  VERSION = 2
end