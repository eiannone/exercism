class Bob
  def hey(remark)
    return 'Fine. Be that way!' if remark.strip.empty?
    return 'Whoa, chill out!' if remark =~ /[A-Z]/ && remark == remark.upcase
    return 'Sure.' if remark.end_with? '?'
    'Whatever.'
  end
end