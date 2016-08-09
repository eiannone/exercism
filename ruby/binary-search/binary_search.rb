class BinarySearch
  attr_reader :list, :middle

  def initialize(list)
    list.each_cons(2) { |a, b| raise ArgumentError if a > b }
    @list = list
    @middle = list.size / 2
  end

  def search_for(num)
    raise RuntimeError if @list.one? && @list[0] != num
    case num <=> list[@middle]
      when -1
        self.class.new(list.first(@middle)).search_for(num)
      when 1
        @middle + 1 + self.class.new(list[(@middle + 1)..-1]).search_for(num)
      else
        @middle
    end
  end
end