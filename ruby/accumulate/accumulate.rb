class Array
  def accumulate
    return enum_for(:accumulate) unless block_given?
    reduce([]) { |out, elem| out << yield(elem) }
  end
end

