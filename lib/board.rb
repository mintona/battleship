class Board
  attr_accessor :cells

  def initialize
    #@cells = Hash.new(0)
  end

  def cells
    coordinates = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]

    cells = Hash.new { |hash, key| hash[key] = [] }
    coordinates.each do |coordinate|
      cells[coordinate] << Cell.new(coordinate)
    end
    cells
  end
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
