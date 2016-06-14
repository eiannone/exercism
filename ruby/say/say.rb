class Say
  UNITS = %w(zero one two three four five six seven eight nine)

  def initialize(num)
    @number = num
  end

  def in_english
    raise ArgumentError unless @number.between?(0, 999_999_999_999)
    out = ''

    billions, num = @number.divmod(1_000_000_000)
    out << ' ' + hundreds(billions) + ' billion' if billions > 0

    millions, num = num.divmod(1_000_000)
    out << ' ' + hundreds(millions) + ' million' if millions > 0

    thousands, num = num.divmod(1_000)
    out << ' ' + hundreds(thousands) + ' thousand' if thousands > 0

    return hundreds(num) if out.empty?
    out[0] = ''
    (num > 0)? out + ' ' + hundreds(num) : out
  end

  private
  def hundreds(num)
    return dozens(num) if num < 100
    hundreds, under100 = num.divmod(100)
    dozens = (under100 == 0)? '' : ' ' + dozens(under100)
    UNITS[hundreds] + ' hundred' + dozens
  end

  def dozens(num)
    return under_20(num) if num < 20
    dozens, units = num.divmod(10)
    units = (units == 0)? '' : '-' + UNITS[units]
    case dozens
      when 2 then 'twenty' + units
      when 3 then 'thirty' + units
      when 4 then 'forty' + units
      when 5 then 'fifty' + units
      when 8 then 'eighty' + units
      else UNITS[dozens] + 'ty' + units
    end
  end

  def under_20(num)
    return UNITS[num] if num < 10
    case num
      when 10 then 'ten'
      when 11 then 'eleven'
      when 12 then 'twelve'
      when 13 then 'thirteen'
      when 15 then 'fifteen'
      when 18 then 'eighteen'
      else UNITS[num - 10] + 'teen'
    end
  end
end