require 'minitest/autorun'
require 'minitest/pride'
require './lib/tutorial'

class TutorialTest < Minitest::Test

  def test_it_exists
    rules = Tutorial.new("Some Rules")

    assert_instance_of Tutorial, rules
  end

  def test_it_prints
    # skip #if you run this and have everything in the tutorial uncommented, it'll just run the whole dang tutorial on loop forever right now, so you can test this works by commenting everything except the first line.  You can check to see it's really working by changing the string, and seeing that it expects the string.
    rules = Tutorial.new("Some Rules")

    assert_equal rules.start_tutorial, "------------------1------------------"
  end

  def test_it_can_continue_rules
    skip # And this one only works if you comment out the gets in continue_rules, otherwise it too loops forever before finishing its test.
    rules = Tutorial.new("Some Rules")

    assert_equal "Hit 'Enter' or 'Return' once to continue, when you're ready", rules.continue_rules
  end

end
