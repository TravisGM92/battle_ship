require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_words.rb'

class GameWordsTest < Minitest::Test

  def test_it_exists
    words = GameWords.new("Game Words")

    assert_instance_of GameWords, words
  end

  def test_can_print_making_board_for_you
    # skip
    words = GameWords.new("Game Words")
    require 'pry'; pry.binding
    assert_equal "*** George ***", words.making_board_for_you
  end

  def test_can_print_game_opening
    # skip
    words = GameWords.new("Game Words")
    # require 'pry'; pry.binding
    assert_equal "                   Enter q to Quit.", words.game_opening
  end

  def test_can_print_comp_intro
    # skip
    words = GameWords.new("Game Words")
    # require 'pry'; pry.binding
    assert_equal "What do your homies call you?", words.comp_intro
  end

end
