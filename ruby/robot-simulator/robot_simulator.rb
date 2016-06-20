class Robot
  BEARINGS = [:north, :east, :south, :west]
  attr_reader :bearing, :coordinates

  def orient(direction)
    raise ArgumentError unless BEARINGS.include? direction
    @bearing = direction
  end

  def turn_right
    @bearing = BEARINGS[BEARINGS.index(@bearing).next % BEARINGS.size]
  end

  def turn_left
    @bearing = BEARINGS[BEARINGS.index(@bearing).pred % BEARINGS.size]
  end

  def at(x, y)
    @coordinates = [x, y]
    self
  end

  def advance
    case @bearing
      when :north
        @coordinates[1] += 1
      when :east
        @coordinates[0] += 1
      when :south
        @coordinates[1] -= 1
      else
        @coordinates[0] -= 1
    end
  end
end

class Simulator
  INSTRUCTIONS = {'L' => :turn_left, 'R' => :turn_right, 'A' => :advance }

  def instructions(str)
    str.chars.map {|c| INSTRUCTIONS[c] }
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y).orient(direction)
  end

  def evaluate(robot, str_instr)
    instructions(str_instr).each {|action| robot.send(action) }
  end
end