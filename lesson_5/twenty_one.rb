
module Hand 
  attr_reader :hand

  def busted? 
    total > 21
  end 

  def total 
    sum = hand.inject(0){|sum, card| sum += card.value}
    num_of_aces = hand.count{|card| card.rank == "Ace"}
    num_of_aces.times{sum += 10 if sum <= 11}
    sum
  end 
end 

class Participant
  include Hand 

  def initialize 
    @hand = []
  end 
end

class Deck
  attr_reader :cards
  def initialize
    @cards = full_deck.shuffle
  end

  def deal(hand)
    hand << cards.pop 
  end

  def full_deck 
    Card::SUITS.each.with_object([]) do |suit, cards|
        Card::RANKS.each do |rank|
          cards << Card.new(rank, suit)
        end
      end
  end 
end

class Card
  NUMBERS = ("2".."10").to_a
  ROYALS = ["Jack", "Queen", "King"]
  ACE = "Ace"
  RANKS = NUMBERS + ROYALS + [ACE]
  SUITS = ["Clubs", "Diamonds", "Hearts", "Spades"]

  attr_reader :rank, :suit, :value 

  def initialize(rank, suit)
    @rank = rank 
    @suit = suit 
    @value = calculate_value(rank)
  end

  def to_s
    "#{rank} of #{suit}"
  end 
 
 
  def calculate_value(rank)
    case rank 
    when *ROYALS then 10
    when ACE then 1
    else rank.to_i
    end 
  end  

end


class Game

  attr_reader :deck, :player, :dealer
  def initialize 
    @deck = Deck.new 
    @player = Participant.new 
    @dealer = Participant.new 
  end 

  def show_cards(hidden: true)
    dealer_hand = hidden ? [dealer.hand[0]] : dealer.hand
    puts "Dealer's hand: #{dealer_hand.join(", ")}."
    puts "Your hand: #{player.hand.join(", ")}."
  end 

  def deal_cards 
    2.times {deck.deal(player.hand)} 
    2.times {deck.deal(dealer.hand)}
  end

  def welcome_message 
    puts "Welcome to Twenty-One!"
  end

  def player_turn 
    loop do 
      show_cards
      puts ""
      choice = nil
      loop do 
        puts "Hit(h) or Stay(s)?"
        choice = gets.chomp[0].downcase
        break if %w(h s).include?(choice)
        puts "Not a valid choice."
      end 

      return if choice == 's'

      deck.deal(player.hand)
      break if player.busted?
      system "clear" 
    end
  end 

  def dealer_turn 
    return if player.busted?
    loop do 
      break if dealer.total > 15
      deck.deal(dealer.hand) 
    end 
  end 

  def show_result
    system "clear"
    show_cards(hidden: false) 
    puts ""
    puts "Dealer's total: #{dealer.total}"
    puts "Your total: #{player.total}"
    puts ""


    if player.busted? 
      puts "You busted! Dealer wins!"
    elsif dealer.busted? 
      puts "Dealer busted! You win!"
    elsif player.total > dealer.total 
      puts "You win!"
    elsif player.total < dealer.total 
      puts "Dealer wins!"
    else 
      puts "It's a tie!"
    end 
  end 


  def start
    system "clear"
    welcome_message
    puts ""
    deal_cards 
    player_turn
    dealer_turn
    show_result
  end
end

Game.new.start
