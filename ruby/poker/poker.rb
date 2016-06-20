class Poker
  attr_reader :best_hand
  def initialize(hands)
    poker_hands = hands.map {|h| PokerHand.new(h) }
    @best_hand = poker_hands.select {|h| h.same_score? poker_hands.max }.map(&:cards)
  end
end

class PokerHand
  attr_reader :cards, :score, :high_value
  SCORES = [:straight_flush, :four_of_a_kind, :full_house, :flush, :straight, :three_of_a_kind, :two_pair,
            :one_pair, :high_card]
  CARD_VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

  def initialize(cards)
    @cards = cards
    @score, @high_value = calculate_score
  end

  def <=>(other)
    return SCORES.index(other.score) <=> SCORES.index(@score) unless @score == other.score
    compare_val(other.high_value, @high_value)
  end

  def same_score?(other)
    other.score == @score && other.high_value == @high_value
  end

  private
  def calculate_score
    values = @cards.map {|c| c[0]}
    high_val, high_count = values.uniq
                               .map { |v| [v, values.count(v)]}
                               .sort { |(v1, c1), (v2, c2)| (c1 == c2) ? compare_val(v1, v2) : c2 <=> c1 }
                               .first
    case values.uniq.count
      when 2
        type = (high_count == 4)? :four_of_a_kind : :full_house
      when 3
        type = (high_count == 3)? :three_of_a_kind : :two_pair
      when 4
        type = :one_pair
      else
        is_straight, high_val = check_straight
        if is_straight
          type = is_flush? ? :straight_flush : :straight
        else
          type = is_flush? ? :flush : :high_card
        end
    end
    return type, high_val
  end

  def compare_val(val1, val2)
    CARD_VALUES.index(val2) <=> CARD_VALUES.index(val1)
  end

  def check_straight
    values = @cards.map {|c| c[0]}.sort {|v1, v2| compare_val(v1, v2) }
    values.shift if values.first == 'A' && values.last == '2'
    return (CARD_VALUES.index(values.first) == CARD_VALUES.index(values.last) + values.count - 1), values.first
  end

  def is_flush?
    @cards.map {|c| c[1]}.uniq.count == 1
  end
end

module BookKeeping
  VERSION = 1
end