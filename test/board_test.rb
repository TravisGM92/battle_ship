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

    def test_it_can_tell_valid_placement
      skip
      board1 = Board.new
      ship1 = Ship.new("Challenger", 5)

      assert_equal board1.valid_placement?(challenger, ["A1, A2"]), false
    end

    # def test_it_can_be_hit
    #   skip
    #   ship1 = Ship.new("Carrier", 5)
    #
    #   ship1.hit
    #
    #
    #   assert_equal 4, ship1.health
    # end
    #
    # def test_it_can_sink
    #   skip
    #   ship1 = Ship.new("Battleship", 4)
    #
    #   ship1.hit
    #   ship1.hit
    #   ship1.hit
    #   ship1.hit
    #
    #   assert_equal true, ship1.sunk?
    # end
    #
    # def test_it_can_make_multiple_ships
    #   skip
    #   ship1 = Ship.new("Battleship", 4)
    #   ship2 = Ship.new("Cruiser", 3)
    #
    #   assert_equal "Battleship", ship1.name
    #   assert_equal "Cruiser", ship2.name
    # end

  end
