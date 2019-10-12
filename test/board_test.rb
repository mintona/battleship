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

  # def test_it_starts_with_no_cells
  #   assert_equal { }, @board.cells
  # end
  def test_it_can_add_cells
    # test that we acutally added cells
    assert_equal true, @board.cells.empty?
  end

  def test_board_has_cells
    assert_instance_of Hash, @board.cells

    @board.add_cells

    assert_equal 16, @board.cells.keys.length
    assert_equal 16, @board.cells.values.length

    cell_value_class = @board.cells.values.all? { |value| value.class == Cell }

    assert_equal true, cell_value_class
  end

  def test_board_cells_can_be_validated

    @board.add_cells #addition

    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")

    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    #Test for row not on board in addition to column not on board.
    assert_equal false, @board.valid_coordinate?("C27")
    # Add test for incorrect input?
    assert_equal false, @board.valid_coordinate?(1)
  end


  def test_letters_same?
    assert_equal false, @board.letters_same?(@cruiser, ["A1", "B1", "D1"])
    assert_equal true, @board.letters_same?(@submarine, ["C2", "C3"])
  end

  def test_numbers_same?
    assert_equal false, @board.numbers_same?(@cruiser, ["A1", "A2", "A4"])
    assert_equal true, @board.numbers_same?(@submarine, ["A1", "B1"])
  end

  def test_coordinates_consecutive?
    assert_equal false, @board.coordinates_consecutive?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.coordinates_consecutive?(@submarine, ["A1", "C1"])
    assert_equal false, @board.coordinates_consecutive?(@submarine, ["A4", "B1"])
    assert_equal false, @board.coordinates_consecutive?(@cruiser, ["A3", "A2", "A1"])
    assert_equal false, @board.coordinates_consecutive?(@submarine, ["C1", "B1"])

    assert_equal true, @board.coordinates_consecutive?(@cruiser, ["A1", "A2", "A3"])
    assert_equal true, @board.coordinates_consecutive?(@cruiser, ["B3", "C3", "D3"])
    assert_equal true, @board.coordinates_consecutive?(@submarine, ["B1", "C1"])
  end

  def test_it_can_validate_placement_of_ships_based_on_ship_length
    @board.add_cells

    assert_equal true, @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
    assert_equal true, @board.valid_placement?(@submarine, ["B3", "B4"])

    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_it_can_validate_placement_of_ships_based_on_consecutive_coordinates
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"])
  end

  def test_diagonal_is_not_a_valid_placement
     assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
     assert_equal false, @board.valid_placement?(@submarine, ["C2", "D3"])
   end

  def test_it_can_tell_valid_placement_based_on_criteria_laid_out_in_previous_tests

    @board.add_cells

    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])

    assert_equal false, @board.valid_placement?(@cruiser, ["D3", "D4", "D5"])
    assert_equal false, @board.valid_placement?(@cruiser, ["D3", "D4"])
    assert_equal false, @board.valid_placement?(@cruiser, [])
  end

  def test_it_can_place_ships

    @board.add_cells

     cell_1 = @board.cells["A1"]
     cell_2 = @board.cells["A2"]
     cell_3 = @board.cells["A3"]

    #first assert that cells are all empty?
    assert_nil cell_1.ship
    assert_nil cell_2.ship
    assert_nil cell_3.ship


    @board.place(@cruiser, ["A1", "A2", "A3"])

    assert_equal @cruiser, cell_1.ship
    assert_equal @cruiser, cell_2.ship
    assert_equal @cruiser, cell_3.ship

    assert_equal true, cell_3.ship == cell_2.ship
  end
end
