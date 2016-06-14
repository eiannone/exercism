class Binary
  attr_reader :to_decimal

  def initialize(str)
    raise ArgumentError unless str =~ /^[01]+$/
    @to_decimal = str.chars.reduce(0) { |res, bit| res * 2 + bit.to_i }
  end
end

module BookKeeping
  VERSION = 2
end