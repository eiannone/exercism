class Cipher
  attr_reader :key

  def initialize(key = nil)
    raise ArgumentError unless key.nil? || key =~ /^[a-z]+$/
    @key = key || (1..100).map { (97 + rand(26)).chr }.join
  end

  def encode(str)
    (0...str.size).map {|i| (97 + ((str[i].ord + @key[i].ord - 194) % 26)).chr }.join
  end

  def decode(str)
    (0...str.size).map {|i| (97 + ((str[i].ord - @key[i].ord) % 26)).chr }.join
  end
end