class Queens
  attr_reader :white, :black
  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError unless (white != black) && (white + black).all? { |x| x.between?(0,7) }
    @white = white
    @black = black
  end

  def to_s
    board = 8.times.inject([]) {|arr, _| arr << '_ _ _ _ _ _ _ _' }
    board[@white[0]][@white[1]*2] = 'W'
    board[@black[0]][@black[1]*2] = 'B'
    board.join("\n")
  end

  def attack?
    @white[0] == @black[0] ||  # Same column
    @white[1] == @black[1] ||  # Same row
    (@white[0] - @white[1]).abs == (@black[0] - @black[1]).abs  # On diagonal
  end
end