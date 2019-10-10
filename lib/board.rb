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
    ship.length == coordinates.length
  end

  def letters_same?(ship, coordinates)
    # First check to see if the letters all match by checking all coordinates against the letter of the first coordinate
    coordinates.all? { |coord| coord[0] == coordinates[0][0]}
  end

  def numbers_consecutive?(ship, coordinates)
      #If the letters matched, then move on to checking if the numbers are consecutive.
      coord_numbers = coordinates.map { |coord| coord[-1].to_i}
      #Create a range based on coordinte numbers
      range = coord_numbers[0]..coord_numbers[-1]
      #create an empty array to put the consecutive numbers based on the range in
      con_arry = []
      #run the each_cons method on the range array using the numbers of coordinates as the argument and putting the consecutive numbers into the con_arry
      range.to_a.each_cons(coordinates.length) { |n| con_arry << n }
      # check to see if the con_arry includes the original coordinates
      con_arry.include?(coordinates)
  end

  def coordinates_consecutive?(ship, coordinates)
    if letters_same?(ship, coordinates) && numbers_consecutive?(ship, coordinates)  
      true
    #elsif numbers are the same && letters are consecutive
    #  true
    end
  end
      # If coordinates are consecutive



      # If coordinates aren't diagnol
#
    # Test must be consecutive coordinates
    # Test can't be diagnol coordinates
    # Test it still passes given all of that criteria



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
