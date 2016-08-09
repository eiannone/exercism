class RailFenceCipher
  VERSION = 1

  def self.encode(str, n_rails)
    return str unless n_rails > 1
    e = fences_enum(n_rails)
    str.chars.each_with_object([]) {|c, a| (a[e.next] ||= '') << c; }.join
  end

  def self.decode(str, n_rails)
    return str unless n_rails > 1
    e = fences_enum(n_rails)
    out = ' ' * str.size
    (0...str.size)
        .each_with_object([]) { |i, a| (a[e.next] ||= []) << i }
        .flatten.each_with_index {|r, i| out[r] = str[i] }
    out
  end

  def self.fences_enum(n_rails)
    (0...n_rails - 1).to_a.concat((n_rails - 1).downto(1).to_a).cycle
  end
end