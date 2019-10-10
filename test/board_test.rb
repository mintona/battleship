require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/ship"
require_relative '../lib/cell'
require_relative '../lib/board'
require "pry"

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_board_has_cells
    assert_instance_of Hash, @board.cells

    assert_equal 16, @board.cells.keys.length
    assert_equal 16, @board.cells.values.length

    cell_value_class = @board.cells.values.all? { |value| value.class == Cell }

    assert_equal true, cell_value_class

  end

   def test_board_cells_can_be_validated

     assert_equal true, @board.valid_coordinate?("A1")
     assert_equal true, @board.valid_coordinate?("D4")

     assert_equal false, @board.valid_coordinate?("A5")
     assert_equal false, @board.valid_coordinate?("E1")
   end

   def test_it_can_validate_placement_of_ships_based_on_ship_length

     assert_equal true, @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
     assert_equal true, @board.valid_placement?(@submarine, ["B3", "B4"])

     assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
     assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])

   end

   def test_coordinates_consecutive?
     assert_equal false, @board.coordinates_consecutive?(@cruiser, ["A1", "A2", "A4"])

     assert_equal false, @board.coordinates_consecutive?(@submarine, ["A1", "C1"])

     assert_equal false, @board.coordinates_consecutive?(@cruiser, ["A3", "A2", "A1"])

     assert_equal false, @board.coordinates_consecutive?(@submarine, ["C1", "B1"])

   end

   def test_it_can_validate_placement_of_ships_based_on_consecutive_coordinates
     skip
     assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])

     assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])

     assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])

     assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"]) # This has something to do with B1 C1 being consecutive.
   end
#
#   def test_it_can_validate_placement_of_ships_on_the_diagnol
# skip
#     assert_equal false, @board.valid_placement?(cruiser, ["A1", "B2", "C3"])
#
#     assert_equal false, @board.valid_placement?(submarine, ["C2", "D3"])
#
#   end
#
#   def test_it_can_tell_valid_placement_based_on_criteria_laid_out_in_previous_tests
#     skip
#     assert_equal true, @board.valid_placement?(submarine, ["A1", "A2"])
#
#     assert_equal true, @valid_placement?(cruiser, ["B1", "C1", "D1"])
#   end

end
