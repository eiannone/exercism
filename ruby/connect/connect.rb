class Board
  attr_reader :winner

  def initialize(board)
    @board = board.map { |row| row.gsub(' ', '') }
    @visited = []
    # Checks all cells in the first row, looking if there is a path connecting with last row
    @board[0].chars.each_with_index do |chr, c|
      next unless chr == 'O' && spans_all_rows?(connected_cells([c, 0]))
      @winner = 'O'
      return
    end
    # Checks all cells in the first column, looking if there is a path connecting with last column
    @board.each_with_index do |row, r|
      next unless row[0] == 'X' && spans_all_cols?(connected_cells([0, r]))
      @winner = 'X'
      return
    end
    @winner = ''
  end

  private
  # Finds all neighbouring cells around one with the same value in it
  def neighbours(x, y)
    # With permutation() we can exclude diagonal cells in the square around a cell
    [-1, 0, 1].permutation(2).map { |(dx, dy)| [x + dx, y + dy]}
        .select { |(c, r)| c >= 0 && r >= 0 && !@board[r].nil? && @board[r][c] == @board[y][x] }
  end

  # Finds all connected cells from a starting cell
  def connected_cells(cell)
    return [] if @visited.include? cell
    @visited << cell
    neighbours(*cell).inject([cell]) { |connected_cells, c| connected_cells.push(*connected_cells(c)) }
  end

  # Checks if a list of connected cells spans all board rows
  def spans_all_rows?(cells_list)
    cells_list.inject([]) {|rows, (_, r)| rows << r }.uniq.size == @board.size
  end

  # Checks if a list of connected cells spans all board columns
  def spans_all_cols?(cells_list)
    cells_list.inject([]) {|cols, (c, _)| cols << c }.uniq.size == @board[0].size
  end
end

module BookKeeping
  VERSION = 1
end