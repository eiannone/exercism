class Bst
  attr_reader :data, :left, :right
  def initialize(node)
    @data = node
  end

  def insert(value)
    if value <= @data
      @left ? @left.insert(value) : @left = Bst.new(value)
    else
      @right ? @right.insert(value) : @right = Bst.new(value)
    end
  end

  def each
    return enum_for(:each) unless block_given?
    @left.each { |elem| yield elem } if @left
    yield @data
    @right.each { |elem| yield elem } if @right
  end
end