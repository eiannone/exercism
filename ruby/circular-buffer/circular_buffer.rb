class CircularBuffer
  class BufferEmptyException < Exception; end
  class BufferFullException < Exception; end

  def initialize(size)
    @size = size
    @values = Array.new(@size)
    clear
  end

  def read
    raise BufferEmptyException unless @head
    out = @values[@head]
    (@head == @tail)? clear : @head = (@head + 1) % @size
    out
  end

  def write(val)
    if @tail
      @tail = (@tail + 1) % @size
      raise BufferFullException if @tail == @head
    else
      @tail = @head = 0
    end
    @values[@tail] = val
  end

  def write!(val)
    read if @tail && @head == (@tail + 1) % @size
    write(val)
  end

  def clear
    @head = @tail = nil
  end
end