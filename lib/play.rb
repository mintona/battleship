class Round
  attr_accessor :start, :computer_gameboard, :computer_player, :human_gameboard, :human_player

  def initialize
    @start = false
    @computer_gameboard = {}
    @computer_player = nil
    @human_gameboard = {}
    @human_player = nil
  end

  def play_game
      create_a_board_with_cells
      create_computer_player
      create_human_player
      computer_takes_first_turn
      human_takes_first_turn
  end

  def create_a_board_with_cells
    @computer_gameboard = Board.new
    @computer_gameboard.add_cells

    @human_gameboard = Board.new
    @human_gameboard.add_cells
  end

  def create_computer_player
    @computer_player = Computer.new
    @computer_player.add_ships
  end

  def create_human_player
    @human_player = Person.new
    @human_player.add_ships
  end

  def computer_takes_first_turn
    # this is actually where we will do the random generator, not in the ship class.
    @computer_gameboard.place(@computer_player.ships[0], ["A1", "A2", "A3"])
    @computer_gameboard.place(@computer_player.ships[1], ["D3", "D4"])
    @computer_gameboard
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
  end

  def human_takes_first_turn
    puts "The Cruiser is two units long and the Submarine is three units long."
    puts @human_gameboard.render

    puts "Enter the squares for the #{@human_player.ships[0].name} (#{@human_player.ships[0].length} spaces), ex: B1 B2 B3"
    print ">"
    user_coordinates_1 = gets.chomp.upcase.split

    @human_gameboard.place(@human_player.ships[0], user_coordinates_1)

    puts @human_gameboard.render(true)

    puts "Enter the squares for the #{@human_player.ships[1].name} (#{@human_player.ships[1].length} spaces)"
    print ">"
    user_coordinates_2 = gets.chomp.upcase.split

    @human_gameboard.place(@human_player.ships[1], user_coordinates_2)

    puts @human_gameboard.render(true)
  end
end
