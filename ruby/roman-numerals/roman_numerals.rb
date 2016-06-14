class Fixnum
  def to_roman
    str = 'M' * (self / 1000)
    num = self % 1000
    str << roman_digit(num / 100, 'C', 'D', 'M')
    num %= 100
    str << roman_digit(num / 10, 'X', 'L', 'C')
    str << roman_digit(num % 10, 'I', 'V', 'X')
  end

  private
  def roman_digit(digit, single, five, ten)
    case digit
      when 9
        single + ten
      when 4
        single + five
      else
        (digit > 4)? five + (single * (digit - 5)) : single * digit
    end
  end
end

module BookKeeping
  VERSION = 2
end