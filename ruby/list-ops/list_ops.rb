class ListOps
  VERSION = 1

  def self.arrays(arr)
    arr.inject(0) { |size, _| size += 1 }
  end

  def self.reverser(arr)
    arr.inject([]) { |out, elem| out.unshift(elem) }
  end

  def self.concatter(arr1, arr2)
    arr2.inject(arr1) { |out, elem| out << elem }
  end

  def self.mapper(arr)
    arr.inject([]) { |out, elem| out << elem + 1 }
  end

  def self.filterer(arr)
    alternate = [true,false].cycle
    arr.each_with_object([]) {|elem, out| out << elem if alternate }
  end

  def self.sum_reducer(arr)
    arr.inject(0) {|sum, elem| sum += elem }
  end

  def self.factorial_reducer(arr)
    arr.inject(1) {|fact, elem| fact *= elem }
  end
end