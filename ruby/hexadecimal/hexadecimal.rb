class Hexadecimal
  HEX_DIGITS = '0123456789abcdef'.chars

  def initialize(hex)
    @hex = hex
  end

  def to_decimal
    return 0 unless @hex =~ /^[a-f\d]+$/
    @hex.chars.inject(0) { |val, nibble| val * 16 + HEX_DIGITS.find_index(nibble) }
  end
end