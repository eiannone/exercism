class Nucleotide
  BASES = %w(A T C G)

  attr_reader :histogram

  def initialize(str)
    raise ArgumentError unless str =~ Regexp.new("^[#{BASES.join}]*$")
    chars = str.chars
    @histogram = BASES.each_with_object({}) { |base, h| h[base] = chars.count(base) }
  end

  def count(base)
    @histogram[base]
  end

  def self.from_dna(str)
    new(str)
  end
end