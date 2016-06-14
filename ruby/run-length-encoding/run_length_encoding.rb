class RunLengthEncoding
  def self.encode(str)
    str.gsub(/(.)\1+/m) { |m| m.length.to_s + $1 }
  end

  def self.decode(encoded)
    encoded.gsub(/([\d]+)\D/) { |m| m[-1] * m.to_i }
  end
end

module BookKeeping
  VERSION = 2
end