require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/game'
require './lib/board'


class SmartTest < Minitest::Test

  def test_it_exists

    smarts = Smart.new

    assert_instance_of Smart, smarts
  end

  def test_it_has_access_to_values
    board = Board.new
    smarts = Smart.new
   # When prompted for input, put 10

    assert_equal smarts.options.length, 40
  end
end
