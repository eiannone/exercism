class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(val, el_next = nil)
    @datum = val
    @next = el_next
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :size, :head

  def self.from_a(arr)
    (arr || []).reverse.inject(self.new, &:push)
  end

  def initialize
    @size = 0
  end

  def empty?
    @size == 0
  end

  def push(datum)
    @head = Element.new(datum, @head)
    @size += 1
    self
  end

  def peek
    @head? @head.datum : nil
  end

  def pop
    val = @head.datum
    @head = @head.next
    @size -= 1
    val
  end

  def to_a
    arr = []
    elem = @head
    while elem
      arr << elem.datum
      elem = elem.next
    end
    arr
  end

  def reverse
    self.class.from_a(to_a.reverse)
  end
end