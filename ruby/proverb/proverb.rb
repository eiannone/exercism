class Proverb
  attr_reader :to_s
  def initialize(*chain, qualifier: nil)
    @to_s = chain.each_cons(2).inject('') { |out, e| out << "For want of a #{e[0]} the #{e[1]} was lost.\n"  } +
        "And all for the want of a #{qualifier ? qualifier + ' ' : ''}#{chain[0]}."
  end
end