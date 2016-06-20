class Matrix
  attr_reader :rows, :columns, :saddle_points

  def initialize(str)
    @rows = str.lines.map { |line| line.split.map(&:to_i) }
    @columns = @rows.transpose

    row_max = @rows.map(&:max)
    col_min = @columns.map(&:min)
    @saddle_points = []
    @rows.each_with_index do |row_elements, row|
      row_elements.each_with_index do |el, col|
        @saddle_points << [row, col] if el == row_max[row] && el == col_min[col]
      end
    end
  end
end