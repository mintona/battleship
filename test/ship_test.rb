require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/ship"

require "pry"

class TestShip < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Ship, @cruiser
  end

  def test_it_has_a_name
    assert_equal "Cruiser", @cruiser.name
  end

  def test_it_has_a_length
    assert_equal 3, @cruiser.length
  end

  def test_is_has_health
    assert_equal 3, @cruiser.health
  end

  def test_health_equals_length
    assert_equal true, @cruiser.length == @cruiser.health
  end

  def test_ship_begins_not_sunk
    assert_equal false, @cruiser.sunk?
  end

  def test_it_can_get_hit

  end


end
