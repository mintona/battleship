class Person

  attr_accessor :ships

  def initialize
    @ships = []
  end

  def add_ships(ship)
    @ships << ship 
    @ships << ship
  end

end
