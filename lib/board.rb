class Board

  def initialize
  end

  def cells
    {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    cells.keys.include?(coordinate)
  end

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

  def valid_placement?(ship, coordinates)
    (coordinates.all? { |coord| valid_coordinate?(coord) }) && (ship.length == coordinates.length) && coordinates_consecutive?(ship, coordinates)
  end
end
