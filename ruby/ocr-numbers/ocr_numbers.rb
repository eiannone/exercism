class OCR
  attr_reader :convert
  def initialize(str)
    @convert = str.lines.each_slice(4).map { |line| get_line_digits(line) }.join(',')
  end

  private
  def get_line_digits(digits_lines)
    digits_lines.map {|line| line.scan(/.../) }.transpose
        .map {|chr| get_digit(chr.join("\n")) }.join
  end

  def get_digit(digit_block)
    case digit_block[1..-5]
      when "_ \n| |\n|_|" then '0'
      when "  \n  |\n  |" then '1'
      when "_ \n _|\n|_ " then '2'
      when "_ \n _|\n _|" then '3'
      when "  \n|_|\n  |" then '4'
      when "_ \n|_ \n _|" then '5'
      when "_ \n|_ \n|_|" then '6'
      when "_ \n  |\n  |" then '7'
      when "_ \n|_|\n|_|" then '8'
      when "_ \n|_|\n _|" then '9'
      else '?'
    end
  end
end