class Deque
  Node = Struct.new(:datum, :prev, :next)

  def push(val)
    node = Node.new(val, @back)
    @back.next = node if @back
    @back = node
    @front ||= @back
  end

  def unshift(val)
    node = Node.new(val, nil, @front)
    @front.prev = node if @front
    @front = node
    @back ||= @front
  end

  def pop
    val = @back.datum
    (@back = @back.prev) ? @back.next = nil : @front = nil
    val
  end

  def shift
    val = @front.datum
    (@front = @front.next) ? @front.prev = nil : @back = nil
    val
  end
end