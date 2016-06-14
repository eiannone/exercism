class ETL
  def self.transform(old)
    old.each_with_object({}) { |(score, letters), new| letters.each {|l| new[l.downcase] = score } }
  end
end