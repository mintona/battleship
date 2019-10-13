class Play
  attr_accessor :start, :gameboard, :computer_player, :human_player

  def initialize
    @start = false
    @gameboard = {}
    @computer_player = nil
    @human_player = nil
  end

  # def greeting
  #   puts "Welcome to BATTLESHIP\n\n"
  # end

  def play_game
    if @start == true
      create_a_board_with_cells
      create_computer_player
      computer_takes_first_turn
      puts "I have laid out my ships on the grid."
      puts "You now need to lay out your two ships"
      puts "The Cruiser is two units long and the Submarine is three units long."
      puts "  1 2 3 4"
      puts "A . . . ."
      puts "B . . . ."
      puts "C . . . ."
      puts "D . . . ."
      puts "Enter the squares for the Cruiser (3 spaces), ex: B1 B2 B3"
      print ">"
      user_coordinates = gets.chomp.upcase.split
      @gameboard.validate_placement?(@human_player.ships[0], user_coordinates) # need to created human player class, add the ships, etc.
    else
      return nil
    end

    # puts "Enter P to play. Enter Q to quit"
    # print ">"
    # answer = gets.chomp
    # if answer.downcase == "p"
    #   @start = true
    #   create_a_board_with_cells
    #   create_computer_player
    # elsif answer.downcase == "q"
    #   @start = false
    # else
    #   puts "Please enter a valid input."
    #   # Add code to re-run the code until the user either says yes or no
    # end
  end

  def create_a_board_with_cells
    @gameboard = Board.new
    @gameboard.add_cells
    @gameboard
  end

  def create_computer_player
    @computer_player = Computer.new
    @computer_player.add_ships
  end

  # def create_human_player
  #   @human_player = Human.new
      #@human_player.add_ships
  # end

  def computer_takes_first_turn
    # this is actually where we will do the random generator, not in the ship class.
    @gameboard.place(@computer_player.ships[0], ["A1", "A2", "A3"])
    @gameboard.place(@computer_player.ships[1], ["D3", "D4"])
    @gameboard
  end


end
