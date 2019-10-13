class Person

  attr_accessor :ships

  def initialize
    @ships = []
  end

  def add_ships
    @ships << cruiser = Ship.new("Cruiser", 3)
    @ships << submarine = Ship.new("Submarine", 2)
  end



end
