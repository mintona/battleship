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

  def test_user_ships_are_empty_initially
    assert_equal true, @player.ships.empty?
  end

  def test_user_can_add_ships

    yacht = Ship.new("Yacht", 4)
    @player.add_ships(@cruiser)
    @player.add_ships(@submarine)

    assert_equal true, @player.ships.include?(@cruiser)
    assert_equal true, @player.ships.include?(@submarine)
    assert_equal false, @player.ships.include?(yacht)
  end

end
