class Turn


  def initialize(players, boards)
    @computer_board = {}
    @player_board = {}
    @computer = nil
    @player = nil
  end

  def computer_coordinate
    random_shot = @human_gameboard.cells.keys.sample(1).join
      until @human_gameboard.valid_coordinate?(random_shot) == true && !@human_gameboard.cells[random_shot].fired_upon?
        random_shot = @human_gameboard.cells.keys.sample(1).join
      end
    random_shot
  end

  def player_coordinate
    puts "\nEnter the coordinate for your shot:"
    print "> "
    answer = gets.chomp.upcase

    until @computer_gameboard.valid_coordinate?(answer) == true && !@computer_gameboard.cells[answer].fired_upon?
      #need to add something here about if they already fired on that shot they need to take another shot. some code above to check on that
      puts "\nPlease enter a valid coordinate:"
      print "> "
      answer = gets.chomp.upcase
    end
  end


  def take_turn(board, coordinate)
    puts "\nFiring missile..."
    sleep(2)

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
end
