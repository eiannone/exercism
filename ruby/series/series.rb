class Series
  def initialize(str)
    @elements = str.chars.map(&:to_i)
  end

  def slices(len)
    raise ArgumentError if len > @elements.length
    @elements.each_cons(len).to_a
  end
end