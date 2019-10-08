require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/ship"
require_relative '../lib/cell'

class CellTest < Minitest::Test

  def setup
    @cell = Cell.new("B4")
  end


  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_initialize
    assert_equal "B4", @cell.coordinate
    assert_equal nil, @cell.ship
  end

  def test_cell_starts_empty
    assert_equal true, @cell.empty?
  end

  def test_place_ship_method
    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)
    assert_equal cruiser, @cell.ship
  end

end
