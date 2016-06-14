module Enumerable
  def keep
    return enum_for(:keep) unless block_given?
    each_with_object([]) { |elem, arr| arr << elem if yield elem }
  end

  def discard
    return enum_for(:discard) unless block_given?
    each_with_object([]) { |elem, arr| arr << elem unless yield elem }
  end
end