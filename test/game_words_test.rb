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
    # require 'pry'; pry.binding
    assert_equal "*** George ***", words.making_board_for_you
  end

  def test_can_print_game_opening
    # skip
    words = GameWords.new("Game Words")
    # require 'pry'; pry.binding
    assert_equal "                   Enter q to Quit.", words.game_opening
  end
  #
  def test_can_print_comp_intro
    # skip
    words = GameWords.new("Game Words")
    # require 'pry'; pry.binding
    assert_equal "What do your homies call you?", words.comp_intro
  end

  def test_can_ship_intro
    words = GameWords.new("Game Words")

    assert_equal "........", words.ship_intro
  end

  def test_can_cruiser_placement_prompt
    # skip
    words = GameWords.new("Game Words")
    # require 'pry'; pry.binding
    assert_equal "So, where's it gonna go?", words.cruiser_placement_prompt
  end

  def test_can_oops_bad_cruiser_coordinates
    # skip
    words = GameWords.new("Game Words")
    # require 'pry'; pry.binding
    assert_equal "Let's try again:", words.oops_bad_cruiser_coordinates
  end

  def test_can_print_oops_bad_cruiser_overlap
    # skip
    words = GameWords.new("Game Words")
    # require 'pry'; pry.binding
    assert_equal "Let's try again: ", words.oops_bad_cruiser_overlap
  end

  def test_can_print_cruiser_has_been_placed
    # skip
    words = GameWords.new("Game Words")
    # require 'pry'; pry.binding
    assert_equal "Ok, here is where your Cruiser has been placed", words.comp_intro
  end

  def test_can_print_cruiser_has_been_placed
    # skip
    words = GameWords.new("Game Words")
    # require 'pry'; pry.binding
    assert_equal "What do your homies call you?", words.cruiser_has_been_placed
  end

  def test_can_print_george_placing_cruiser
    # skip
    words = GameWords.new("Game Words")
    # require 'pry'; pry.binding
    assert_equal "It's not gonna be that easy.", words.george_placing_cruiser
  end

  def test_can_print_add_submarine_prompt
    # skip
    words = GameWords.new("Game Words")
    # require 'pry'; pry.binding
    assert_equal "So, where's it gonna go? ", words.add_submarine_prompt
  end

  def test_can_print_oops_bad_sub_coordinates
    # skip
    words = GameWords.new("Game Words")
    # require 'pry'; pry.binding
    assert_equal "Let's try again: ", words.oops_bad_sub_coordinates
  end

  def test_can_print_oops_bad_sub_overlap
    # skip
    words = GameWords.new("Game Words")
    # require 'pry'; pry.binding
    assert_equal "Let's try again: ", words.oops_bad_sub_overlap
  end

  def test_can_print_comp_intro
    # skip
    words = GameWords.new("Game Words")
    # require 'pry'; pry.binding
    assert_equal "What do your homies call you?", words.comp_intro
  end

  def test_can_print_lets_take_a_look
    words = GameWords.new("Game Words")

    assert_equal "........", words.lets_take_a_look
  end

  def test_can_print_slowing_things_down
    words = GameWords.new("Game Words")

    assert_equal "", words.slowing_things_down
  end

  def test_can_print_first_fire_prompt
    # skip
    words = GameWords.new("Game Words")
    # require 'pry'; pry.binding
    assert_equal "in this format: 'A2' OR 'D3'", words.first_fire_prompt
  end

  def test_can_print_first_fire_prompt
    # skip
    words = GameWords.new("Game Words")
    # require 'pry'; pry.binding
    assert_equal "in this format: 'A2' OR 'D3'", words.first_fire_prompt
  end
















end
