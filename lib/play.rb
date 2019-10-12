class Play
  attr_accessor :play

  def initialize
    @play = false
    @board = {}
  end

  def greeting
    puts "Welcome to BATTLESHIP\n"
  end

  def play?
    puts "Enter P to play. Enter Q to quit"
    print ">"
    answer = gets.chomp
    if answer.downcase == "p"
      @play = true
    elsif answer.downcase == "q"
      @play = false
    else
      puts "Please enter a valid input."
      # Add code to re-run the code until the user either says yes or no
    end
  end

  def create_a_board_with_cells
    if @play == true
     @board = Board.new
     @board.add_cells
   end
   #binding.pry
   @board.cells

  end

  def computer_takes_first_turn
    computer = Computer.new
    computer.place_ships
  end


end
