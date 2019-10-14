class Computer
  attr_reader :ships

  def initialize
    @ships = []
  end

  def add_ships(ship)
    @ships << ship
  end

  # def access_ships
  #   cruiser = Ship.new("Cruiser", 3)
  #   submarine = Ship.new("Submarine", 2)
  # end

  def generate_random_coordinates
    # conform to all the stuff about valid coordinates.
  end

  def place_ships(gameboard)
    # cruiser = Ship.new("Cruiser", 3)
    # submarine = Ship.new("Submarine", 2)

    # board = Board.new
    # board.add_cells

    # These arrays for coordinate placement need to be randomized.
    # gameboard.place(cruiser, ["A1", "A2", "A3"])
    # gameboard.place(submarine, ["D3", "D4"])
    #
    # #only here so we can see what the computer is doing with the hard coded coordinates above
    # puts play.board.render(true)
  end

end
