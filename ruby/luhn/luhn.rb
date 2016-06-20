class Luhn
  attr_reader :addends, :checksum

  def self.create(num)
    (num * 10) + (10 - self.new(num * 10).checksum) % 10
  end

  def initialize(num)
    n = num.to_s.chars.map(&:to_i)
    @addends = (-n.size..-1).map {|i| (i.odd? || n[i] == 9) ? n[i] : (n[i] * 2) % 9 }
    @checksum = @addends.reduce(&:+)
  end

  def valid?
    @checksum % 10 == 0
  end
end