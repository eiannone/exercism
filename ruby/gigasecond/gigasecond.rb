module BookKeeping
  VERSION = 3
end

class Gigasecond
  def self.from(t)
    t + 10**9
  end
end