require 'pry'

class Ship

  attr_reader :name, :length, :sunk
  attr_accessor :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @sunk = false
  end

  def sunk?

    # lines 19-23 is alternate code.
    if health == 0
      sunk = true
    else
      sunk = false
    end

    # @sunk = true if @health == 0
    # or # @sunk = false unless @health == 0 work as expected either?
  end

  def hit
    health -= 1
  end


end
