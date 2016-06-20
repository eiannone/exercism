class PigLatin
  def self.translate(str)
    str.gsub(/\b[\w]+\b/) {|word| translate_word(word) + 'ay' }
  end

  private
  def self.translate_word(word)
    return word if word.start_with? *%w(a e i o u yt xr)
    m = word.match(/^([^aeiou]*qu|th[r]?|[s]?ch|[\w])/)
    m.post_match + m[0]
  end
end