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
      computer_places_ships
      human_takes_first_turn
      until @human_player.ships.all? { |ship| ship.sunk? } || @computer_player.ships.all? { |ship| ship.sunk? }
        turn
        turn_2
          # Can we STOP taking turns in general once there is a winner? ie. if user sinks the computer ship, can the computer be prevented from taking the last turn.
      end
      end_game
  end

  def create_a_board_with_cells
    @computer_gameboard = Board.new
    @computer_gameboard.add_cells

    @human_gameboard = Board.new
    @human_gameboard.add_cells
  end

  def create_computer_player
    @computer_player = Computer.new

    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    @computer_player.add_ships(cruiser)
    @computer_player.add_ships(submarine)
  end

  def create_human_player
    @human_player = Person.new

    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    @human_player.add_ships(cruiser)
    @human_player.add_ships(submarine)
  end

  def computer_places_ships
    @computer_player.ships.each do |ship|
      random_coordinates = @computer_gameboard.cells.keys.sample(ship.length)
      until @computer_gameboard.valid_placement?(ship, random_coordinates) == true
        random_coordinates = @computer_gameboard.cells.keys.sample(ship.length)
      end
      @computer_gameboard.place(ship, random_coordinates)
    end

    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."

  end

  def human_takes_first_turn
    puts "The Cruiser is two units long and the Submarine is three units long."

    puts @human_gameboard.render

    @human_player.ships.each do |ship|
      puts "Enter the squares for the #{ship.name} (#{ship.length} spaces), ex:"
      print ">"
      user_coordinates = gets.chomp.upcase.split

        until @human_gameboard.valid_placement?(ship, user_coordinates) == true
          puts "Those are invalid coordinates. Please try again:"
          print ">"
          user_coordinates = gets.chomp.upcase.split
        end

        @human_gameboard.place(ship, user_coordinates)
        puts @human_gameboard.render(true)
    end
  end

  def turn
    # loop here to run until the number of turns equals the number of ships in the player and computer ships array
    # add a counter here? counts each turn every time it runs?
    puts "=============COMPUTER BOARD============="
    puts @computer_gameboard.render
    puts "==============PLAYER BOARD=============="
    puts @human_gameboard.render(true)

    puts "Enter the coordinate for your shot:"
    print ">"
    answer = gets.chomp.upcase

    until @computer_gameboard.valid_coordinate?(answer) == true && !@computer_gameboard.cells[answer].fired_upon?
      #need to add something here about if they already fired on that shot they need to take another shot. some code above to check on that
      puts "Please enter a valid coordinate:"
      print ">"
      answer = gets.chomp.upcase
    end

    @computer_gameboard.cells[answer].fire_upon
      if @computer_gameboard.cells[answer].render == "M"
        result = "miss."
      elsif @computer_gameboard.cells[answer].render == "H"
        result = "hit!"
      elsif @computer_gameboard.cells[answer].render == "X"
        result = "hit and sunk the #{@computer_gameboard.cells[answer].ship.name}!"
      end

    puts "Your shot on #{answer} was a #{result}"
    #then we would display the result of the computer's shot
  end

  def turn_2

    random_shot = @human_gameboard.cells.keys.sample(1).join
      until @human_gameboard.valid_coordinate?(random_shot) == true && !@human_gameboard.cells[random_shot].fired_upon?
        random_shot = @human_gameboard.cells.keys.sample(1).join
      end

    @human_gameboard.cells[random_shot].fire_upon
      if @human_gameboard.cells[random_shot].render == "M"
        result = "The computer missed your ships."
      elsif @human_gameboard.cells[random_shot].render == "H"
        result = "The computer hit your ship!"
      elsif @human_gameboard.cells[random_shot].render == "X"
        result = "The computer hit and sunk the #{@human_gameboard.cells[answer].ship.name}!"
      end

      puts "#{result}"
  end

  def end_game
    if @human_player.ships.all? { |ship| ship.sunk? }
      puts "I won!"
    elsif @computer_player.ships.all? { |ship| ship.sunk? }
      puts "You won!"
    end 
  end

end
