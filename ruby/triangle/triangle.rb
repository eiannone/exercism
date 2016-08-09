TriangleError = Class.new(ArgumentError)

class Triangle
  def initialize(*s)
    @sides = s.sort!
    # The sum of smaller sides must be greater than the greatest side
    raise TriangleError unless s[0] + s[1] > s[2]
  end

  def kind
    case @sides.uniq.length
      when 1 then :equilateral
      when 2 then :isosceles
      else :scalene
    end
  end
end