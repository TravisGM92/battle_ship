require 'minitest/autorun'
require 'minitest/pride'
require './lib/endgame'

class EndgameTest < Minitest::Test

  def test_it_exists
    the_end = Endgame.new("Yay")

    assert_instance_of Endgame, the_end
  end

  def test_player_win_message
    the_end = Endgame.new("Yay")

    assert_equal "love to play again. Would you?", the_end.player_wins
  end

  def test_player_win_message
    the_end = Endgame.new("Yay")

    assert_equal "One more game?", the_end.player_loses
  end
end
