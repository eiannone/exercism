class Complement
  def self.of_dna(dna)
    return '' unless dna =~ /^[ACGT]+$/
    dna.tr('GCTA', 'CGAU')
  end
end

module BookKeeping
  VERSION = 4
end