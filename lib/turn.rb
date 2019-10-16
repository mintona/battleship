class Turn
  attr_reader :computer_board, :player_board, :computer, :player

  def initialize(players, boards)
    @computer_board = boards[0]
    @player_board = boards[1]
    @computer = players[0]
    @player = players[1]
  end

  def computer_coordinate
    coordinate = @player_board.cells.keys.sample(1).join
      until @player_board.valid_coordinate?(coordinate) == true && !@player_board.cells[coordinate].fired_upon?
        coordinate = @player_board.cells.keys.sample(1).join
      end
    coordinate
  end

  def player_coordinate
    puts "\nEnter the coordinate for your shot:"
    print "> "
    coordinate = gets.chomp.upcase

    until @computer_board.valid_coordinate?(coordinate) == true && !@computer_board.cells[coordinate].fired_upon?
      #need to add something here about if they already fired on that shot they need to take another shot. some code above to check on that
      puts "\nPlease enter a valid coordinate:"
      print "> "
      coordinate = gets.chomp.upcase
    end
    coordinate
  end

  def all_ships_sunk?(player_or_computer)
    player_or_computer.ships.all? { |ship| ship.sunk? }
  end


  def take_turn_player(board, coordinate)
    puts "\nFiring missile..."
    #sleep(2)

    board.cells[coordinate].fire_upon
      if board.cells[coordinate].render == "M"
        result = "miss."
      elsif board.cells[coordinate].render == "H"
        result = "hit!"
      elsif board.cells[coordinate].render == "X"
        result = "hit and sunk my #{board.cells[coordinate].ship.name}!"
      end

    puts "\nYour shot on #{coordinate} was a #{result}"
  end

  def take_turn_computer(board, coordinate)
    puts "\nFiring missile..."
    #sleep(2)

    board.cells[coordinate].fire_upon
      if board.cells[coordinate].render == "M"
        result = "miss."
      elsif board.cells[coordinate].render == "H"
        result = "hit!"
      elsif board.cells[coordinate].render == "X"
        result = "hit and sunk your #{board.cells[coordinate].ship.name}!"
      end

    puts "\nMy shot on #{coordinate} was a #{result}"
  end


end
