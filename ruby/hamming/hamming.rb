module BookKeeping
  VERSION = 3
end

class Hamming
  def self.compute(seq1, seq2)
    raise ArgumentError unless seq1.length == seq2.length
    (0..seq1.length - 1).count{ |c| seq1[c] != seq2[c] }
  end
end