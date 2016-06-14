class Anagram
  def initialize(str)
    @str = str.downcase
    @chars = @str.chars.sort
  end

  def match(words)
    words.select { |w| w.length == @str.length && w.downcase != @str && w.downcase.chars.sort == @chars }
  end
end