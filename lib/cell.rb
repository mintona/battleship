class Cell

  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(cruiser) # Refer to iteration 1 requirements
    cruiser = Ship.new("Cruiser", 3)
    @ship = cruiser
  end

end
