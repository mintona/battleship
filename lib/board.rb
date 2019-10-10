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

  def valid_placement?(ship, coordinates)
    coords = cells.keys
    consecutive_coordinates = []
    coords.each_cons(coordinates.length) { |coord| consecutive_coordinates << coord } # Does not account for [A4, B1] ... NOT actually consecutive

    if (ship.length == coordinates.length) && consecutive_coordinates.include?(coordinates)
      true
    else
      false
    end
      # If coordinates are consecutive




      # If coordinates aren't diagnol
#
    # Test must be consecutive coordinates
    # Test can't be diagnol coordinates
    # Test it still passes given all of that criteria
  end


  # def cells - maybe we can make this work another way later... it's returning the new cell in an array and we don't want it in an array
  #   coordinates = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
  #   cells = Hash.new { |hash, key| hash[key] = [] }
  #   @coordinates.each do |coordinate|
  #     cells[coordinate] << Cell.new(coordinate)
  #   end
  #   cells
  # end
end



# needed_cells = ["A1", "A2", "A3", "A4"]
# cells = Hash.new { |hash, key| hash[key] = [] }
# needed_cells.each do |coordinate|
#   cells[coordinate] << Cell.new(coordinate)
# end
#
# coordinates = ["A1", "A2", "A3", "A4"]
# cells = coordinates.group_by do |coordinate|
#   Cell.new(coordinate)
# end
#
# cells = coordinates.group_by { |coordinate| Cell.new(coordinate) }
