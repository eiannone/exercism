class ValueError < ArgumentError ; end

class Board
  def self.transform(field)
    raise ValueError unless valid?(field)
    field.each_with_index do |row, r|
      row.chars.each_with_index do |char, c|
        next unless char == ' '
        mines = (field[r-1][c-1..c+1] + field[r+1][c-1..c+1] + row[c-1] + row[c+1]).count('*')
        field[r][c] = mines.to_s unless mines == 0
      end
    end
    field
  end

  private
  def self.valid?(field)
    (field.first =~ /^\+[-]+\+$/) && (field.last == field.first) &&
      field[1...-1].all? {|row| row =~ /^\|[ *]+\|$/ && row.size == field.first.size }
  end
end