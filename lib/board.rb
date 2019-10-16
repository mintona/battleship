class Board
  attr_accessor :cells

  def initialize
    @cells = {}
  end

  def add_cells
    coordinates_array = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4",]

    coordinates_array.each { |c| @cells[c] = Cell.new(c) }


    # @cells = {
    #   "A1" => Cell.new("A1"),
    #   "A2" => Cell.new("A2"),
    #   "A3" => Cell.new("A3"),
    #   "A4" => Cell.new("A4"),
    #   "B1" => Cell.new("B1"),
    #   "B2" => Cell.new("B2"),
    #   "B3" => Cell.new("B3"),
    #   "B4" => Cell.new("B4"),
    #   "C1" => Cell.new("C1"),
    #   "C2" => Cell.new("C2"),
    #   "C3" => Cell.new("C3"),
    #   "C4" => Cell.new("C4"),
    #   "D1" => Cell.new("D1"),
    #   "D2" => Cell.new("D2"),
    #   "D3" => Cell.new("D3"),
    #   "D4" => Cell.new("D4")
    # }

  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  #def all_coordinates_valid?
  #coordinates.all? { |coord| valid_coordinate?(coord) }
#end


  def letters_same?(ship, coordinates)
    coordinates.all? { |coord| coord[0] == coordinates[0][0]}
  end

  def  numbers_same?(ship, coordinates)
    coordinates.all? { |coord| coord[-1] == coordinates[0][-1]}
  end

  def numbers_consecutive?(ship, coordinates)
      coord_numbers = coordinates.map { |coord| coord[-1].to_i}
      range = coord_numbers[0]..coord_numbers[-1]
      con_arry = []
      range.to_a.each_cons(coordinates.length) { |n| con_arry << n }
      con_arry.include?(coord_numbers)
  end

  def letters_consecutive?(ship, coordinates)
    coord_letters = coordinates.map { |coord| coord[0] }
    range = coord_letters[0]..coord_letters[-1]
    con_arry = []
    range.to_a.each_cons(coordinates.length) { |l| con_arry << l}
    con_arry.include?(coord_letters)
  end

  def coordinates_consecutive?(ship, coordinates)

    if letters_same?(ship, coordinates) && numbers_consecutive?(ship, coordinates)
      true
    elsif numbers_same?(ship, coordinates) && letters_consecutive?(ship, coordinates)
      true
    else
      false
    end
  end

  def cells_empty?(ship_type, coordinates)
    coordinates.all? do |coord|
      @cells[coord].empty?
    end
  end

  def valid_placement?(ship_type, coordinates)
    #method to repace code on line 86 above in line 39
    if (coordinates.all? { |coord| valid_coordinate?(coord) })
      cells_empty?(ship_type, coordinates) && (ship_type.length == coordinates.length) && coordinates_consecutive?(ship_type, coordinates)
    else
      false
    end
  end

  def place(ship_type, coordinates)

    # Check to be sure the coordinates are valid.
    # if valid_placement?(ship, coordinates) == true
    if valid_placement?(ship_type, coordinates)

    #board_cells = cells
      coordinates.each do |c|
        @cells[c].ship = ship_type # Should we use a cell method for this instead of just setting the ship value to the name of the ship?
      end
    end
    @cells
  end

  def render(show_ship = false)
    a = ["A1", "A2", "A3", "A4"]
    b = ["B1", "B2", "B3", "B4"]
    c = ["C1", "C2", "C3", "C4"]
    d = ["D1", "D2", "D3", "D4"]

    a = a.map { |coord| @cells[coord].render(show_ship) }
    b = b.map { |coord| @cells[coord].render(show_ship) }
    c = c.map { |coord| @cells[coord].render(show_ship) }
    d = d.map { |coord| @cells[coord].render(show_ship) }

    "  1 2 3 4 \n" + "A #{a.join(" ")} \n" + "B #{b.join(" ")} \n" + "C #{c.join(" ")} \n" + "D #{d.join(" ")} \n"
  end


end
