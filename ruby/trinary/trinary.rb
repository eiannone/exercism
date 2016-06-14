class Trinary
  attr_reader :to_decimal
  def initialize(str)
    @to_decimal = (str =~ /^[012]+$/)? str.chars.inject(0) { |val, bit| val * 3 + bit.to_i } : 0
  end
end