require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

#test to make changes
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
      ship2 = Ship.new("Cruiser", 3)

      assert_equal true, board1.valid_placement?(ship1, ["A1", "A2"])
      assert_equal true, board1.valid_placement?(ship2, ["A1", "B1", "C1"])
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

    def test_other_invalid_placements
      board1 = Board.new
      ship1 = Ship.new("Cruiser", 3)


      assert_equal false, board1.valid_placement?(ship1, ["A1", "B1", "C2"])
    end

    def test_other_invalid_placement_with_one_coordinate
      board1 = Board.new
      ship1 = Ship.new("Cruiser", 3)


      assert_equal false, board1.valid_placement?(ship1, ["A1"])
    end

    def test_coordinates_cant_be_diagonal
      board1 = Board.new
      ship1 = Ship.new("Cruiser", 3)


      assert_equal false, board1.valid_placement?(ship1, ["A1", "B2", "C3"])
    end

    def test_it_cell_is_empty
      board1 = Board.new
      ship1 = Ship.new("Cruiser", 3)
      cell1 = board1.cells["A1"]

      assert_equal true, cell1.cell.empty?
    end

    def test_if_ship_can_be_placed
      board1 = Board.new
      ship1 = Ship.new("Cruiser", 3)
      cell1 = board1.cells["A1"]
      board1.place(ship1, ["A1", "A2", "A3"])

      assert_equal 3, cell1.ship.health
    end

    def test_ship_is_placed_in_multiple_cells
      board1 = Board.new
      ship1 = Ship.new("Cruiser", 3)
      cell1 = board1.cells["A1"]
      cell2 = board1.cells["A2"]
      board1.place(ship1, ["A1", "A2", "A3"])

      assert_equal true, cell1.ship == cell2.ship
    end

    def test_if_ships_cant_overlap
      board1 = Board.new
      ship1 = Ship.new("Cruier", 2)
      ship2 = Ship.new("Cruiser", 3)
      board1.cells
      board1.place(ship2, ["A1", "A2", "A3"])
      cell_1 = board1.cells["A1"]
      cell_2 = board1.cells["A2"]
      cell_3 = board1.cells["A3"]

      assert_equal false, board1.valid_placement?(ship1, ["A1", "B2"])
    end

# add maybe 4-5 tests for valid placement
# true and false ..... plus the 100 other things that could go wrong
# have tests for all the things that we ourselves did

  end
