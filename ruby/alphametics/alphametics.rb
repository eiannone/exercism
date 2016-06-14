class Alphametics
  def solve(expression)
    expr = AlphaExpression.new(expression)
    letters = expression.scan(/[A-Z]/).uniq.join
    # Digit '0' cannot be at the beginning of a number
    no_zero_pos = expression.scan(/\b[A-Z]\B/).inject([]) { |arr, l| arr << letters.index(l) }

    (0..9).to_a.combination(letters.size) do |candidate|
      check_zero = candidate.include?(0)? no_zero_pos : []
      candidate.permutation.lazy.select { |p| check_zero.all? {|pos| p[pos] != 0 } }.each do |p|
        return Hash[*(letters.chars.zip(p).flatten)] if expr.value(letters, p.join)
      end
    end
    raise RuntimeError, 'Impossible to solve'
  end
end

class AlphaExpression
  OPERATORS = {'==' => :==, '+' => :+, '-' => :-, '*' => :*, '/' => :/, '^' => :**}

  def initialize(str)
    @operator = OPERATORS.keys.find { |op| str.include? op }
    if @operator
      left, _, right = str.partition(@operator)
      @l_op = AlphaExpression.new(left.strip)
      @r_op = AlphaExpression.new(right.strip)
    else
      raise ArgumentError, 'Wrong format for operand' unless str.strip =~ /^[A-Z\d]+$/
      @l_op = str.strip
    end
  end

  def value(letters, digits)
    return @l_op.tr(letters, digits).to_i unless @operator
    @l_op.value(letters, digits).send(OPERATORS[@operator], @r_op.value(letters, digits))
  end
end

module BookKeeping
  VERSION = 1
end