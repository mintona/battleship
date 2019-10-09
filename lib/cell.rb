class Cell

  attr_reader :coordinate
  attr_accessor :ship, :fired_on

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_on = false
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
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

  def render
    if empty? == true && fired_upon? == true
      "M"
    elsif empty?
      "."
    end
  end


end
