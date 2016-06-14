class School
  def initialize
    @grades = Hash.new([])
  end

  def add(name, grade)
    @grades[grade] += [name]
    @grades[grade].sort!
  end

  def grade(g)
    @grades[g]
  end

  def to_h
    @grades.sort.to_h
  end
end

module BookKeeping
  VERSION = 1
end