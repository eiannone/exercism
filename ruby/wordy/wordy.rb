class WordProblem
  OPERATIONS = {'minus' => :-, 'plus' => :+, 'multiplied by' => :*, 'divided by' => :/ }
  attr_reader :answer

  def initialize(str)
    m = str.match('^What is ([-\d]+)(?: (?:' + OPERATIONS.keys.join('|') + ') [-\d]+)+\?$')
    raise ArgumentError unless m
    @answer = str.scan(Regexp.new('(' + OPERATIONS.keys.join('|') + ') ([-\d]+)'))
      .inject(m[1].to_i) { |val, (op, arg)| val.send(OPERATIONS[op], arg.to_i) }
  end
end