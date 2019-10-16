require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/ship"
require_relative "../lib/computer"

class ComputerTest < Minitest::Test

  def setup
    @computer = Computer.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Computer, @computer
  end

  def test_it_starts_with_no_ships
    assert_equal [], @computer.ships
  end

  def test_it_can_add_ships
    yacht = Ship.new("Yacht", 4)

    @computer.add_ships(@cruiser)
    assert_equal 1, @computer.ships.length

    @computer.add_ships(@submarine)
    assert_equal 2, @computer.ships.length
    
    assert_equal true, @computer.ships.include?(@cruiser)
    assert_equal true, @computer.ships.include?(@submarine)

    assert_equal false, @computer.ships.include?(yacht)
  end

end
