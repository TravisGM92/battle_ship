require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/tutorial'
require './lib/endgame'
require './lib/game'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    turn = Turn.new

    assert_instance_of Turn, turn
  end

  # def test_choose_random_player
  #   game = Game.new
  #   gets.chomp!
  #
  #   assert_equal "Great", game.start()
  # end


end
