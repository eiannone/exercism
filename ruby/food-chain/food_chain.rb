class FoodChain
  def self.song
    song = ''
    ANIMALS.each do |animal, verse|
      song << "I know an old lady who swallowed a #{animal}.\n#{verse}\n"
      ANIMALS.keys.take_while { |k| k != animal}.reverse.inject(animal) do |prev_animal, cur_animal|
        catch_animal = VARIATIONS.has_key?(cur_animal)? VARIATIONS[cur_animal] : cur_animal.to_s
        song << "She swallowed the #{prev_animal} to catch the #{catch_animal}.\n"
        cur_animal
      end
      song << "\n"
    end
    song << "I know an old lady who swallowed a horse.\nShe's dead, of course!\n"
  end

  ANIMALS = {
      fly: 'I don\'t know why she swallowed the fly. Perhaps she\'ll die.',
      spider: 'It wriggled and jiggled and tickled inside her.',
      bird: 'How absurd to swallow a bird!',
      cat: 'Imagine that, to swallow a cat!',
      dog: 'What a hog, to swallow a dog!',
      goat: 'Just opened her throat and swallowed a goat!',
      cow: 'I don\'t know how she swallowed a cow!'
  }

  VARIATIONS = {
      fly: "fly.\nI don't know why she swallowed the fly. Perhaps she'll die",
      spider: 'spider that wriggled and jiggled and tickled inside her'
  }
end

module BookKeeping
  VERSION = 2
end