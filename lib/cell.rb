class Cell

  attr_reader :coordinate
  attr_accessor :ship, :fired_on

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_on = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(cruiser)
    @ship = cruiser
  end

  def fired_upon?
    @fired_on
  end

  def fire_upon
    if !empty?
      @ship.health -= 1
      @fired_on = true
    else empty?
      @fired_on = true
    end
  end

  def render(show_ship = false)
      if empty? && fired_upon?
        "M"
      elsif empty?
        "."
      elsif !empty? && !fired_upon? && show_ship == true
        "S"
      elsif !empty? && !fired_upon?
        "."
      elsif !empty? && fired_upon? && @ship.sunk?
        "X"
      elsif !empty? && fired_upon?
        "H"
      end
  end

end
