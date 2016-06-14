class Scrabble
  SCORES = {
      1 => [:A, :E, :I, :O, :U, :L, :N, :R, :S, :T],
      2 => [:D, :G ],
      3 => [:B, :C, :M, :P],
      4 => [:F, :H, :V, :W, :Y],
      5 => [:K],
      8 => [:J, :X],
     10 => [:Q, :Z]
  }.each_with_object({}) {|(score, letters), scores| letters.each { |l| scores[l.to_s] = score } }

  attr_reader :score

  def initialize(str)
    @score = self.class.score(str)
  end

  def self.score(str)
    str.to_s.upcase.scan(/[A-Z]/).inject(0) {|score, letter| score + SCORES[letter]}
  end
end