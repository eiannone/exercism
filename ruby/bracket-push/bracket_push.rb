class Brackets
  def self.paired?(str)
    brackets = str.gsub(/[^\{\}\[\]\(\)]/, '')
    while brackets.gsub!(/\{\}|\[\]|\(\)/, ''); end
    brackets.empty?
  end
end

module BookKeeping
  VERSION = 2
end