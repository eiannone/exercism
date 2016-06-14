class Acronym
  def self.abbreviate(str)
    str.scan(/\b([A-z])|[a-z]([A-Z])/).join.upcase
  end
end

module BookKeeping
  VERSION = 1
end