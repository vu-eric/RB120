class Card
  include Comparable 
  attr_reader :rank, :suit, :value
  RANK_TO_VALUE = {'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14}

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = RANK_TO_VALUE.fetch(rank, rank)
  end

  def <=>(other)
    value <=> other.value
  end

  def to_s
    "#{rank} of #{suit}"
  end


end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  attr_accessor :cards

  def initialize
    @cards = (RANKS.product SUITS).map!{|arr| Card.new(arr[0], arr[1])}.shuffle
  end

  def draw 
    initialize if cards.empty?
    cards.pop 
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.



