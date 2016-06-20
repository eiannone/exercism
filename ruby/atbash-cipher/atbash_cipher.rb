class Atbash
  DICTIONARY = ('a'..'z').zip(('a'..'z').to_a.reverse).each_with_object({}) {|(k, v), d| d[k] = v }

  def self.encode(str)
    str.gsub(/\W/, '').downcase.chars
        .map { |c| DICTIONARY.has_key?(c)? DICTIONARY[c] : c }
        .each_slice(5).map(&:join)
        .join(' ')
  end
end