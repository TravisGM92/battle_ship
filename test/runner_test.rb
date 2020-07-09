require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './runner'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_can_it_start
    game = Game.new

    assert_equal "Enter p to play. Enter q to quit.", game.start
  end

  def test_
  end


end