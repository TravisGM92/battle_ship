require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_choose_quit
    game = Game.new

    # game1 = mock("Game")
    game.stubs(:user_input).returns("q")

    assert_equal "Goodbye!", game.start
  end

  def test_choose_play
    game = Game.new

    # game1 = mock("Game")
    game.stubs(:user_input).returns("p")

    # game.stubs(:user_input).returns("Cool Name")

    assert_equal "What do your homies call you?", game.start
  end

  def test_choose_rules
    game = Game.new

    # game1 = mock("Game")
    game.stubs(:user_input).returns("r")

    game.stubs(:user_input).returns(enter)

    assert_equal " ", game.start
  end


  # def test_invalid_entry_on_main_menu
  #   # game = Game.new
  #
  #   game1 = mock("Game")
  #   game1.stubs(:user_input).returns("rthartjq")
  #
  #   assert_equal "                  Enter q to Quit.", game1.start
  # end


end
