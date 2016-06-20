class Garden
  DEFAULT_STUDENTS = %w(alice bob charlie david eve fred ginny harriet ileana joseph kincaid larry)
  PLANTS = {'C' => :clover, 'G' => :grass, 'R' => :radishes, 'V' => :violets}

  def initialize(diagram, students = DEFAULT_STUDENTS)
    @students = students.map(&:downcase).sort.map {|n| n.to_sym }
    @plants = {}
    diagram.lines.map {|l| l.strip.scan(/../) }.transpose.map(&:join).each_with_index do |pl, i|
      @plants[@students[i]] = pl.chars.map { |p| PLANTS[p] }
    end
  end

  def method_missing(name)
    super unless respond_to? name
    @plants.key?(name)? @plants[name] : []
  end

  def respond_to?(method)
    @students.include? method
  end
end