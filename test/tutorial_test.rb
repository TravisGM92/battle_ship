require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/tutorial'

class TutorialTest < Minitest::Test

  def test_it_exists
    rules = Tutorial.new("Some Rules")

    assert_instance_of Tutorial, rules
  end

  def test_it_prints
    rules = Tutorial.new("Some Rules")

    refute_equal rules.start_tutorial, "nothing"
  end
end
