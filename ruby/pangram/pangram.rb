class Pangram
  def self.is_pangram?(str)
    ('a'..'z').all? { |c| str.include?(c) || str.include?(c.upcase) }
  end
end

module BookKeeping
  VERSION = 2
end