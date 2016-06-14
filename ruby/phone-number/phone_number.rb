class PhoneNumber
  BAD_NUMBER = '0000000000'.freeze
  attr_reader :number, :area_code, :to_s

  def initialize(str_number)
    @number = clean_number(str_number)
    @area_code = @number[0..2]
    @to_s = "(#{@area_code}) #{@number[3..5]}-#{@number[6..9]}"
  end

  private
  def clean_number(str_number)
    return BAD_NUMBER unless str_number =~ /^[\d\.\-\(\)\s]+$/
    str_number.gsub!(/\D/, '')
    str_number[0] = '' if str_number.size == 11 && str_number[0] == '1'
    (str_number.size == 10)? str_number : BAD_NUMBER
  end
end