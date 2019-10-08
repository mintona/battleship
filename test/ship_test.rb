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
    assert_equal 3, @cruiser.health
    assert_equal true, @cruiser.length == @cruiser.health
    # what test method makes the most sense here?
  end

  def test_ship_begins_not_sunk
    assert_equal false, @cruiser.sunk?
  end

  def test_it_can_get_hit_and_hit_decreases_health_by_1
# Do we need to make sure of the starting health in our test? We tested it has health above.
    assert_equal 3, @cruiser.health

    @cruiser.hit
    assert_equal 2, @cruiser.health
# Next line is making sure that even though the health changed, the length stayed constant
    assert_equal 3, @cruiser.length

    @cruiser.hit
    assert_equal 1, @cruiser.health

    @cruiser.hit
    assert_equal 0, @cruiser.health

    # Is this unnessary?
    # @cruiser.hit
    # assert_equal -1, @cruiser.health
  end

  def test_hits_equal_to_ship_length_makes_ship_sunk
    @cruiser.hit
    @cruiser.hit
    assert_equal false, @cruiser.sunk?

    @cruiser.hit
    assert_equal true, @cruiser.sunk?
  end


end
