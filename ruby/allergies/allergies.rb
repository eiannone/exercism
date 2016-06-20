class Allergies
  ALLERGENS = %w(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats)
  attr_reader :list

  def initialize(num)
    @list = ALLERGENS.select.with_index { |_, i| (num & (1 << i)) > 0 }
  end

  def allergic_to?(elem)
    @list.include? elem
  end
end