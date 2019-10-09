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
    assert_nil @cell.ship
  end

  def test_cell_starts_empty
    assert_equal true, @cell.empty?
  end

  def test_place_ship_method
    cruiser = Ship.new("Cruiser", 3)

    assert_nil @cell.ship
    assert_equal true, @cell.empty?

    @cell.place_ship(cruiser)

    assert_equal cruiser, @cell.ship
    assert_equal false, @cell.empty?
  end

  def test_it_can_be_fire_upon
    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)

    assert_equal cruiser, @cell.ship
    assert_equal 3, @cell.ship.health
    assert_equal false, @cell.fired_upon?

    @cell.fire_upon

    assert_equal 2, @cell.ship.health
    assert_equal true, @cell.fired_upon?

  end

  def test_it_can_render
    assert_equal true, @cell.empty?

    assert_equal ".", @cell.render
    @cell.fire_upon

    assert_equal "M", @cell.render
  end


end
