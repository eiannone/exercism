class Game
  def initialize
    @frames = []
  end

  def roll(pins)
    raise RuntimeError, 'Game is over. Cannot roll anymore' if game_over?
    raise RuntimeError, 'Invalid pin quantity' unless (pins + pins_down).between?(0, 10)
    if frame_closed?
      @frames.push [pins]
    else
      @frames.last << pins
    end
  end

  def score
    raise RuntimeError, 'Cannot calculate score until game is over' unless game_over?
    (0..9).inject(0) { |tot, frame| tot + frame_points(frame) }
  end

  private
  def game_over?
    @frames.length == 10 && frame_closed?
  end

  def frame_closed?
    if @frames.length < 10
      @frames.empty? || @frames.last.length == 2 || @frames.last[0] == 10
    else
      @frames[9].length == 3 || (@frames[9].length == 2 && @frames[9].reduce(0, :+) < 10)
    end
  end

  def pins_down
    frame_closed?? 0 : @frames.last.reduce(0, :+) % 10 # Modulus added to take account for strikes on last frame
  end

  def frame_points(f)
    pins = @frames[f].reduce(0, :+)
    return pins if pins < 10 || f == 9 # Open frame or last frame
    next_f = @frames[f + 1]
    return 10 + next_f[0] if pins == 10 && @frames[f].length == 2  # Spare
    10 + next_f[0] + ((next_f.length > 1)? next_f[1] : @frames[f + 2][0]) # Strike
  end
end

module BookKeeping
  VERSION = 1
end