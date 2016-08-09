class Triangle
  attr_reader :rows
  def initialize(rows)
    @rows = [[1]]
    (1...rows).each do |r|
      @rows.push([1, @rows[r - 1].each_cons(2).map {|a| a.reduce(:+)}, 1].flatten)
    end
  end
end