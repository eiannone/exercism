class House
  ELEMENTS = {
      'malt' => nil,
      'rat' => 'ate',
      'cat' => 'killed',
      'dog' => 'worried',
      'cow with the crumpled horn' => 'tossed',
      'maiden all forlorn' => 'milked',
      'man all tattered and torn' => 'kissed',
      'priest all shaven and shorn' => 'married',
      'rooster that crowed in the morn' => 'woke',
      'farmer sowing his corn' => 'kept',
      'horse and the hound and the horn' => 'belonged to'
  }
  def self.recite
    (0...ELEMENTS.length).inject("This is the house that Jack built.\n") do |out, level|
      who = ELEMENTS.keys[level]
      out << "\nThis is the #{who}\n"
      level.pred.downto(0).inject(ELEMENTS[who]) do |verb, l|
        who = ELEMENTS.keys[l]
        out << "that #{verb} the #{who}\n"
        ELEMENTS[who]
      end
      out << "that lay in the house that Jack built.\n"
    end
  end
end