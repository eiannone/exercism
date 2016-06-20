class Triplet
  def initialize(*triplet)
    @triplet = triplet
  end

  def sum
    @triplet.reduce(&:+)
  end

  def product
    @triplet.reduce(&:*)
  end

  def pythagorean?
    @triplet[0]**2 + @triplet[1]**2 == @triplet[2]**2
  end

  def self.where(max_factor:, min_factor: 1, sum: nil)
    triplets = (min_factor..max_factor).to_a.combination(3).map {|c| new(*c) }.select { |p| p.pythagorean? }
    sum ? triplets.select {|p| p.sum == sum } : triplets
  end
end