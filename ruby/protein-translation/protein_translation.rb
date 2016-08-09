class InvalidCodonError < StandardError; end

class Translation
  CODONS = {
    Methionine: %w(AUG),
    Phenylalanine: %w(UUU UUC),
    Leucine: %w(UUA UUG),
    Serine: %w(UCU UCC UCA UCG),
    Tyrosine: %w(UAU UAC),
    Cysteine: %w(UGU UGC),
    Tryptophan: %w(UGG),
    STOP: %w(UAA UAG UGA)
  }
  CODONS_SEQ = CODONS.each_with_object(Hash.new) do |(name, seqs), codons|
    seqs.each { |seq| codons[seq] = name }
  end

  def self.of_codon(codon)
    raise InvalidCodonError unless CODONS_SEQ.include? codon
    CODONS_SEQ[codon].to_s
  end

  def self.of_rna(strand)
    strand.chars.each_slice(3).inject([]) do |rna, seq|
      codon = of_codon(seq.join)
      return rna if codon == 'STOP'
      rna << codon
    end
  end
end