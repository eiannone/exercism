class Scale
  HALF_TONES = { 'm' => 1, 'M' => 2, 'A' => 3}

  attr_reader :name, :pitches

  def initialize(tonic, type, intervals = 'm' * 12)
    @name = "#{tonic.capitalize} #{type}"
    @pitches = [tonic.capitalize]

    notes = use_flats?(tonic, type)? %w(A Bb B C Db D Eb E F Gb G Ab) : %w(A A# B C C# D D# E F F# G G#)
    notes.rotate!(notes.index(@pitches[0]))
    pos = 0
    intervals.chars[0..-2].each do |interval|
      @pitches << notes[pos += HALF_TONES[interval]]
    end
  end

  private
  def use_flats?(tonic, type)
    (tonic.size == 2 && tonic[1] == 'b') || (tonic.upcase == 'F') ||
        (%w(C D G).include?(tonic.upcase) && [:minor, :locrian, 'harmonic_minor'].include?(type))
  end
end