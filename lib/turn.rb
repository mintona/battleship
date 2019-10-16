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
    puts "\n==========CURRENT COMPUTER BOARD=========="
    puts @computer_board.render
    puts "\n===========CURRENT PLAYER BOARD==========="
    puts @player_board.render(true)
    puts "\nEnter the coordinate for your shot:"
    print "> "

    coordinate = gets.chomp.upcase


  if !@computer_board.valid_coordinate?(coordinate)
    until @computer_board.valid_coordinate?(coordinate) == true && !@computer_board.cells[coordinate].fired_upon?
    puts "\nPlease enter a valid coordinate:"
    print "> "
    coordinate = gets.chomp.upcase
    end
    coordinate

  elsif @computer_board.valid_coordinate?(coordinate) == true && @computer_board.cells[coordinate].fired_upon?
        puts "\nYou have already fired upon this cell."
        until @computer_board.valid_coordinate?(coordinate) == true && !@computer_board.cells[coordinate].fired_upon?
        puts "\nPlease enter a valid coordinate:"
        print "> "
        coordinate = gets.chomp.upcase
        end
  coordinate

  elsif @computer_board.valid_coordinate?(coordinate) == true && !@computer_board.cells[coordinate].fired_upon?
    coordinate
  end
end

  def all_ships_sunk?(player_or_computer)
    player_or_computer.ships.all? { |ship| ship.sunk? }
  end

  def take_turn_player(coordinate)
    puts "\nFiring your missile..."
    sleep(1.5)

    @computer_board.cells[coordinate].fire_upon
      if @computer_board.cells[coordinate].render == "M"
        result = "miss."
      elsif @computer_board.cells[coordinate].render == "H"
        result = "hit!"
      elsif @computer_board.cells[coordinate].render == "X"
        result = "hit and sunk my #{@computer_board.cells[coordinate].ship.name}!"
      end

    puts "\nYour shot on #{coordinate} was a #{result}"
    sleep(1.5)
  end

  def take_turn_computer(coordinate)
    puts "\nFiring my missile..."
    sleep(1.5)

    @player_board.cells[coordinate].fire_upon
      if @player_board.cells[coordinate].render == "M"
        result = "miss."
      elsif @player_board.cells[coordinate].render == "H"
        result = "hit!"
      elsif @player_board.cells[coordinate].render == "X"
        result = "hit and sunk your #{@player_board.cells[coordinate].ship.name}!"
      end

    puts "\nMy shot on #{coordinate} was a #{result}"
    sleep(1.5)
  end

end
