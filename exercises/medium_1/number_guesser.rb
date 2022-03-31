class GuessingGame
  attr_reader :answer, :low, :high
  attr_accessor :guess, :num_of_guesses

  def initialize(low=1, high=100)
    @low = low 
    @high = high
    @num_of_guesses = Math.log2(high - low + 1).to_i + 1
    @answer = (low..high).to_a.sample 
  end

  def player_guess 
    loop do 
      puts "Enter a number between #{low} and #{high}: "
      self.guess = gets.chomp.to_i
      break if (low..high).include?(guess)
      puts "Invalid guess."
    end
    self.num_of_guesses -= 1
  end

  def compare_guess
    case guess <=> answer
    when 0 then puts "That's the number!"
    when 1 then puts "Your guess is too high."
    when -1 then puts "Your guess is too low."
    end
  end

  def won?
    guess == answer
  end

  def display_remaining_guesses
    puts "You have #{num_of_guesses} remaining."
  end

  def loss_message 
    puts "You have no more guesses. You lost!"
  end

  def victory_message 
    puts ""
    puts "You won!"
    puts ""
  end

  def lost?
    num_of_guesses == 0 
  end

  def display_result
    won? ? victory_message : loss_message 
  end

  def reset 
    initialize(low, high)
  end

  def play 
    loop do 
      puts ""
      display_remaining_guesses
      player_guess 
      compare_guess 
      break if won? || lost? 
    end 
    puts "" 
    display_result
    reset 
  end
end

game = GuessingGame.new(501, 1500)
game.play
game.play
