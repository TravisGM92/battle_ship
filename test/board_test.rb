require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'



class BoardTest < Minitest::Test

    def test_it_exists
      board1 = Board.new

      assert_instance_of Board, board1
    end

    def test_it_has_16_cells
      # skip
      board1 = Board.new



      assert_equal board1.cells.length, 16
    end

    def test_it_can_validate_coordinates
      # skip
      board1 = Board.new
      board1.cells

      assert_equal board1.valid_coordinate?("A2"), true
    end

    def test_it_can_show_valid_placement_with_row_and_length
      # skip
      board1 = Board.new
      ship1 = Ship.new("Submarine", 2)


      assert_equal true, board1.valid_placement?(ship1, ["A1", "A2"])
    end

    def test_it_can_show_invalid_placement_due_to_length
      # skip
      board1 = Board.new
      ship1 = Ship.new("Cruiser", 3)


      assert_equal false, board1.valid_placement?(ship1, ["A1", "A2"])
    end

    def test_it_can_show_valid_placement_with_column_and_length
      # skip
      board1 = Board.new
      ship1 = Ship.new("Submarine", 2)

      assert_equal true, board1.valid_placement?(ship1, ["A1", "B1"])
    end

    def test_it_can_show_invalid_placement_due_to_column_placement
      # skip
      board1 = Board.new
      ship1 = Ship.new("Cruiser", 3)


      assert_equal false, board1.valid_placement?(ship1, ["A1", "C1", "D1"])
    end

  end
