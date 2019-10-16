require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/ship"
require_relative "../lib/player"

class PlayerTest < Minitest::Test

  def setup
    @player = Player.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Player, @player
  end

  def test_it_starts_without_ships
    assert_equal [], @player.ships
  end

  def test_it_can_add_ships
    yacht = Ship.new("Yacht", 4)

    @player.add_ships(@cruiser)
    assert_equal 1, @player.ships.length

    @player.add_ships(@submarine)
    assert_equal 2, @player.ships.length

    assert_equal true, @player.ships.include?(@cruiser)
    assert_equal true, @player.ships.include?(@submarine)

    assert_equal false, @player.ships.include?(yacht)
  end

end
