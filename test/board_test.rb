require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/ship"
require_relative '../lib/cell'
require_relative '../lib/board'
require "pry"

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_board_has_cells
    assert_instance_of Hash, @board.cells

    assert_equal 16, @board.cells.keys.length
#binding.pry

    assert_instance_of Cell, @board.cells.values[0][0]

  end

end
