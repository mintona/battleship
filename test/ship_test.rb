require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/ship"

class TestShip < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Ship, @cruiser
  end

  def test_it_has_attributes
    assert_equal "Cruiser", @cruiser.name

    assert_equal 3, @cruiser.length

    assert_equal 3, @cruiser.health

    assert_equal false, @cruiser.sunk?
  end

  def test_health_equals_length
    assert_equal 3, @cruiser.health
    assert_equal true, @cruiser.length == @cruiser.health
  end

  def test_each_hit_decreases_health_by_1
    assert_equal 3, @cruiser.health

    @cruiser.hit
    assert_equal 2, @cruiser.health

    @cruiser.hit
    assert_equal 1, @cruiser.health

    @cruiser.hit
    assert_equal 0, @cruiser.health
    assert_equal 3, @cruiser.length
  end

  def test_it_sinks_when_health_is_zero
    assert_equal false, @cruiser.sunk?

    @cruiser.hit
    @cruiser.hit
    assert_equal false, @cruiser.sunk?

    @cruiser.hit
    assert_equal true, @cruiser.sunk?
  end

end
