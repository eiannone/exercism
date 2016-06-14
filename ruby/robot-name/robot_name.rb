class Robot
  LETTERS = ('A'..'Z').to_a
  NUMBERS = ('0'..'9').to_a
  @@used_names = []

  def name
    @name ||= generate_name
  end

  def reset
    @name = nil
  end

  private
  def generate_name
    begin
      @name = LETTERS.sample + LETTERS.sample
      3.times { @name << NUMBERS.sample }
    end while @@used_names.include? @name
    @@used_names << @name
    @name
  end
end

module BookKeeping
  VERSION = 2
end