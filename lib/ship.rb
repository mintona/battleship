class Ship

  attr_reader :name, :length, :health, :sunk

  def initialize(name, length)
    @name = name
    @length = length
    @health = @length
    @sunk = false
  end

  # def health
  #   @health = @length
  # end

  def sunk?
    @sunk
  end


end
