require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'



class ShipTest < Minitest::Test

  def test_it_exists
    ship1 = Ship.new('Challenger', 5)

    assert_instance_of Ship, ship1
  end

  def test_it_has_a_length
    # skip
    ship1 = Ship.new("Challenger", 5)


    assert_equal ship1.length, 5
  end

  def test_it_has_a_name
    # skip
    ship1 = Ship.new("Carrier", 5)

    assert_equal ship1.name, "Carrier"
  end

  def test_it_has_health
    # skip
    ship1 = Ship.new("Challenger", 5)


    assert_equal ship1.health, 5
  end

  def test_it_can_be_hit
    # skip
    ship1 = Ship.new("Carrier", 5)

    ship1.hit


    assert_equal 4, ship1.health
  end

  def test_it_can_sink
    ship1 = Ship.new("Battleship", 4)

    ship1.hit
    ship1.hit
    ship1.hit
    ship1.hit

    assert_equal true, ship1.sunk?
  end

  def test_it_can_make_multiple_ships
    ship1 = Ship.new("Battleship", 4)
    ship2 = Ship.new("Cruiser", 3)

    assert_equal "Battleship", ship1.name
    assert_equal "Cruiser", ship2.name
  end

end
