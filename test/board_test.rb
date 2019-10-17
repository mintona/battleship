require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/ship"
require_relative '../lib/cell'
require_relative '../lib/board'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_it_starts_with_no_cells
    assert_instance_of Hash, @board.cells

    assert_equal true, @board.cells.empty?
  end

  def test_it_can_add_cells
    assert_equal true, @board.cells.empty?

    @board.add_cells

    assert_equal 16, @board.cells.length

    cell_value_class = @board.cells.values.all? { |value| value.class == Cell }

    assert_equal true, cell_value_class
  end

  def test_board_cells_can_be_validated
    @board.add_cells

    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")

    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")

    assert_equal false, @board.valid_coordinate?(1)
    assert_equal false, @board.valid_coordinate?("A")
  end

  def test_it_can_check_for_same_letters
    assert_equal false, @board.letters_same?(@cruiser, ["A1", "B1", "D1"])
    assert_equal true, @board.letters_same?(@submarine, ["C2", "C3"])
  end

  def test_it_can_check_for_same_numbers
    assert_equal false, @board.numbers_same?(@cruiser, ["A1", "A2", "A4"])
    assert_equal true, @board.numbers_same?(@submarine, ["A1", "B1"])
  end

  def test_it_can_check_for_consecutive_coordinates
    assert_equal false, @board.coordinates_consecutive?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.coordinates_consecutive?(@cruiser, ["A3", "A2", "A1"])

    assert_equal false, @board.coordinates_consecutive?(@submarine, ["A1", "C1"])
    assert_equal false, @board.coordinates_consecutive?(@submarine, ["A4", "B1"])
    assert_equal false, @board.coordinates_consecutive?(@submarine, ["C1", "B1"])

    assert_equal true, @board.coordinates_consecutive?(@cruiser, ["A1", "A2", "A3"])
    assert_equal true, @board.coordinates_consecutive?(@cruiser, ["B3", "C3", "D3"])

    assert_equal true, @board.coordinates_consecutive?(@submarine, ["B1", "C1"])
  end

  def test_it_can_check_if_all_coordinates_are_valid
    @board.add_cells

    coordinates1 = ["A1", "A2", "A3"]
    coordinates2 = ["A3", "A4", "A5"]

    assert_equal true, @board.all_coordinates_valid?(coordinates1)
    assert_equal false, @board.all_coordinates_valid?(coordinates2)
  end

  def test_it_checks_all_the_coordinates_for_empty_cells
    @board.add_cells

    @board.place(@cruiser, ["A1", "A2", "A3"])

    assert_equal false, @board.cells_empty?(@submarine, ["A1", "B1"])
    assert_equal true, @board.cells_empty?(@submarine, ["C1", "C2"])
  end

  def test_it_can_validate_placement_of_ships_based_on_ship_length
    @board.add_cells

    assert_equal true, @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
    assert_equal true, @board.valid_placement?(@submarine, ["B3", "B4"])

    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_it_can_validate_placement_of_ships_based_on_consecutive_coordinates
    @board.add_cells

    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"])

    assert_equal true, @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "B1"])
  end

  def test_diagonal_is_not_a_valid_placement
    @board.add_cells

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

  def test_overlapping_ships_are_not_valid_placement
    @board.add_cells

    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]

    @board.place(@cruiser, ["A1", "A2", "A3"] )

    assert_equal @cruiser, cell_1.ship
    assert_equal @cruiser, cell_2.ship
    assert_equal @cruiser, cell_3.ship

    assert_equal false, @board.valid_placement?(@submarine, ["A1", "B1"])
    assert_equal true, @board.valid_placement?(@submarine, ["B1", "B2"])
  end

  def test_it_can_place_ships
    @board.add_cells

    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]
    cell_4 = @board.cells["A4"]

    assert_nil cell_1.ship
    assert_nil cell_2.ship
    assert_nil cell_3.ship

    @board.place(@cruiser, ["A1", "A2", "A3"])

    assert_equal @cruiser, cell_1.ship
    assert_equal @cruiser, cell_2.ship
    assert_equal @cruiser, cell_3.ship

    assert_equal true, cell_3.ship == cell_2.ship
    assert_equal false, cell_3.ship == cell_4.ship
  end

  def test_it_can_render_when_ships_are_hidden
    @board.add_cells

    @board.place(@cruiser, ["A1", "A2", "A3"])

    assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n", @board.render

    @board.place(@submarine, ["D3", "D4"])

    assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n", @board.render
  end

  def test_it_can_render_showing_ships
    @board.add_cells

    @board.place(@cruiser, ["A1", "A2", "A3"])

    assert_equal "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n", @board.render(true)

    @board.place(@submarine, ["D3", "D4"])

    assert_equal "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . S S \n", @board.render(true)
  end

end
