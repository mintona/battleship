require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/ship"

require "pry"

class TestShip < Minitest::Test

  def test_it_exists
    cruiser = Ship.new("Cruiser", 3)

    assert_instance_of Ship, cruiser
  end

  def test_it_has_a_name
    cruiser = Ship.new("Cruiser", 3)

    assert_equal "Cruiser", cruiser.name
  end

  def test_it_has_a_length
    cruiser = Ship.new("Cruiser", 3)

    assert_equal 3, cruiser.length
  end

  def test_is_has_health
    cruiser = Ship.new("Cruiser", 3)

    assert_equal 3, cruiser.health
  end

  def test_health_equals_length
    cruiser = Ship.new("Cruiser", 3)

    assert_equal true, cruiser.length == cruiser.health
  end

  def test_ship_begins_unsunk
    cruiser = Ship.new("Cruiser", 3)

    assert_equal false, cruiser.sunk?
  end
  

end
