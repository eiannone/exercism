# require 'set'
# class CustomSet < Set ; end

class CustomSet < Array
  def subset?(set)
    all? { |elem| set.member? elem }
  end

  def disjoint?(set)
    none? { |elem| set.member? elem }
  end

  def ==(set)
    (size == set.size) && subset?(set)
  end

  def add(elem)
    push(elem) unless member?(elem)
    self
  end

  def intersection(set)
    self.class.new(select {|elem| set.member?(elem)})
  end

  def difference(set)
    self.class.new(select {|elem| !set.member?(elem)})
  end

  def union(set)
    self.class.new(self.concat(set))
  end
end

module BookKeeping
  VERSION = 1
end