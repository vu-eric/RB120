class Board 
  WINNING_LINES = [[1,2,3], [4,5,6], [7,8,9]] +
                  [[1,4,7], [2,5,8], [3,6,9]] + 
                  [[1,5,9], [3,5,7]]
  def initialize
    @squares = {}
    (1..9).each {|key| @squares[key] = Square.new} 
  end

  def get_square_at(key)
    @squares[key]
  end

  def set_square_at(key, marker)
    @squares[key].marker = marker 
  end 

  def marker_at(square)
    @squares[square].marker 
  end

  def unmarked_keys
    @squares.keys.select{|key| @squares[key].unmarked?} 
  end 

  def full? 
    unmarked_keys.empty?
  end

  def reset 
    initialize 
  end 

  def winning_line(line) 
    return TTTGame::HUMAN_MARKER if line.all?{|square| marker_at(square) == TTTGame::HUMAN_MARKER}

    TTTGame::COMPUTER_MARKER if line.all?{|square| marker_at(square) == TTTGame::COMPUTER_MARKER}
  end 

  def someone_won? 
    !!detect_winner
  end

  #Returns winning marker or nil  
  def detect_winner 
    WINNING_LINES.each do |line|
      winning_marker = winning_line(line)
      return winning_marker if winning_marker 
    end 
    nil 
  end
end

class Square 
  attr_accessor :marker

  INITIAL_MARKER = " "
  def initialize
    @marker = INITIAL_MARKER
  end

  def to_s
    @marker 
  end

  def unmarked?
    @marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker 
  def initialize(marker)
    @marker = marker 
  end

  
end

class TTTGame
  attr_reader :board, :human, :computer 

  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"

  def initialize 
    @board = Board.new 
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end 

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
   
  end 

  def display_goodbye_message 
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end 

  def display_board(clear = true)
    system 'clear' if clear
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ""
    puts "     |     |"
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}  "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}  "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}  "
    puts "     |     |"
    puts ""
  end 

  def display_result 
    display_board 
    case board.detect_winner 
    when HUMAN_MARKER then puts "You won!"
    when COMPUTER_MARKER then puts "Computer won!"
    else "It's a tie!"
    end 
  end

  def human_moves 
    square = nil
    loop do 
      puts "Choose a square (#{board.unmarked_keys.join(', ')}): "
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid square."
    end 
    
    board.set_square_at(square, human.marker)
  end

  def computer_moves
    board.set_square_at(board.unmarked_keys.sample, computer.marker)
  end

  def play_again?
    answer = nil 
    loop do 
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end
    answer == "y" 
  end

  def play
    system "clear"
    display_welcome_message
    loop do 
      display_board(false)
      loop do 
        human_moves 
        break if board.someone_won? || board.full? 
        computer_moves
        break if board.someone_won? || board.full? 
        display_board
      end 
      display_result 
      break unless play_again?
      board.reset
      system 'clear'
      puts "Let's play again!"
      puts ""
    end
    display_goodbye_message 
  end
end 
game = TTTGame.new 
game.play 

