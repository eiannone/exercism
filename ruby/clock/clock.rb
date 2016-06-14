class Clock
  attr_reader :minutes

  def initialize(mins)
    @minutes = mins % 1440;
  end

  def self.at(hour, min)
    new(hour * 60 + min)
  end

  def to_s
    '%02d:%02d' % [@minutes / 60, @minutes % 60]
  end

  def ==(other)
    minutes == other.minutes
  end

  def +(mins)
    self.class.new(@minutes + mins)
  end
end

module BookKeeping
  VERSION = 2
end