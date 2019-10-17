class Prep

  attr_accessor :computer_board, :player_board, :computer, :player

  def initialize
    @computer_board = {}
    @player_board = {}
    @computer = nil
    @player = nil
  end

  def create_computer_player
    @computer_board = Board.new
    @computer_board.add_cells

    @computer = Computer.new

    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    @computer.add_ships(cruiser)
    @computer.add_ships(submarine)
  end

  def create_player
    @player_board = Board.new
    @player_board.add_cells

    @player = Player.new

    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    @player.add_ships(cruiser)
    @player.add_ships(submarine)
  end

  def all_players
    [@computer, @player]
  end

  def all_boards
    [@computer_board, @player_board]
  end

  def computer_places_ships
    @computer.ships.each do |ship|
      random_coordinates = @computer_board.cells.keys.sample(ship.length)
      until @computer_board.valid_placement?(ship, random_coordinates)
        random_coordinates = @computer_board.cells.keys.sample(ship.length)
      end
      @computer_board.place(ship, random_coordinates)
    end
    puts "\nI have laid out my ships on the grid."
    puts "\nYou now need to lay out your two ships."
  end

  def player_places_ships
    puts "\nThe Cruiser is three units long and the Submarine is two units long.\n\n"

    puts @player_board.render

    @player.ships.each do |ship|
      puts "\nEnter the squares for the #{ship.name} (#{ship.length} spaces):"
      print "> "
      user_coordinates = gets.chomp.upcase.split
        until @player_board.valid_placement?(ship, user_coordinates)
          puts "\nThose are invalid coordinates. Please try again:"
          print "> "
          user_coordinates = gets.chomp.upcase.split
        end
      @player_board.place(ship, user_coordinates)
      puts "\n"
      puts @player_board.render(true)
    end
  end

end
