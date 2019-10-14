require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/ship"
require_relative "../lib/person"

class PersonTest < Minitest::Test

  def setup
    @person = Person.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Person, @person
  end

  def test_user_ships_are_empty_initially
    assert_equal true, @person.ships.empty?
  end

  def test_user_can_add_ships

    yacht = Ship.new("Yacht", 4)
    @person.add_ships(@cruiser)
    @person.add_ships(@submarine)

    assert_equal true, @person.ships.include?(@cruiser)
    assert_equal true, @person.ships.include?(@submarine)
    assert_equal false, @person.ships.include?(yacht)
  end

end
