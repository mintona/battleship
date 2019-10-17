require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/ship"
require_relative '../lib/cell'

class CellTest < Minitest::Test

  def setup
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_it_has_attributes
    assert_equal "B4", @cell.coordinate
    assert_nil @cell.ship
    assert_equal false, @cell.fired_on
  end

  def test_it_empty_without_ship
    assert_nil @cell.ship
    assert_equal true, @cell.empty?
  end

  def test_it_can_place_ship
    assert_nil @cell.ship
    assert_equal true, @cell.empty?

    @cell.place_ship(@cruiser)

    assert_equal @cruiser, @cell.ship
    assert_equal false, @cell.empty?
  end

  def test_it_can_be_fired_upon
    assert_equal false, @cell.fired_upon?

    @cell.fire_upon

    assert_equal true, @cell.fired_upon?
  end

  def test_it_changes_ship_health_when_fired_upon
    @cell.place_ship(@cruiser)
    assert_equal @cruiser, @cell.ship
    assert_equal false, @cell.fired_upon?

    @cell.fire_upon
    assert_equal 2, @cell.ship.health
    assert_equal true, @cell.fired_upon?
  end

  def test_it_can_render_properly_when_empty
    assert_equal true, @cell.empty?
    assert_equal ".", @cell.render

    @cell.fire_upon

    assert_equal "M", @cell.render
  end

  def test_it_can_render_properly_with_ship_and_optional_boolean
    assert_equal ".", @cell.render

    @cell.place_ship(@cruiser)

    assert_equal ".", @cell.render
    assert_equal "S", @cell.render(true)
  end

  def test_it_can_render_properly_after_hit_ship
    @cell.place_ship(@cruiser)
    assert_equal ".", @cell.render

    @cell.fire_upon
    assert_equal "H", @cell.render
  end

  def test_it_can_render_properly_when_sunk
    @cell.place_ship(@cruiser)
    assert_equal ".", @cell.render

    @cell.fire_upon

    assert_equal "H", @cell.render
    assert_equal false, @cruiser.sunk?

    @cruiser.hit
    @cruiser.hit

    assert_equal true, @cruiser.sunk?
    assert_equal "X", @cell.render
  end

end
