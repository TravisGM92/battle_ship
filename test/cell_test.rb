require 'minitest/autorun'
require 'minitest/pride'
require "./lib/cell"



class CellTest < Minitest::Test


  def test_it_exists
    cell1 = Cell.new("A2")

    assert_instance_of Cell, cell1
  end

  def test_it_has_a_coordinate
    cell1 = Cell.new("A1")


    assert_equal cell1.coordinate, "A1"
  end

  def test_it_can_check_for_a_ship
    cell1 = Cell.new("A1")


    assert_nil cell1.ship, nil
  end

  def test_it_can_check_if_cell_is_empty
    cell1 = Cell.new("A1")


    assert_equal cell1.empty?, true
  end

  def test_it_can_place_a_ship
    cell1 = Cell.new("A1")
    cruiser = Ship.new("Cruiser", 3)
    cell1.place_ship(cruiser)


    assert_equal cell1.empty?, false
  end

  def test_it_can_be_fired_upon
    cell1 = Cell.new("A1")
    cruiser = Ship.new("Cruiser", 3)
    cell1.place_ship(cruiser)
    cell1.fire_upon

    assert_equal cell1.fired_upon?, true
  end

  def test_it_can_show_fired_or_not
    cell1 = Cell.new("A1")
    cruiser = Ship.new("Cruiser", 3)
    cell1.place_ship(cruiser)
    cell1.fire_upon

    assert_equal cell1.render, "H"
  end

  def test_it_can_show_ship
      cell1 = Cell.new("A1")
      cruiser = Ship.new("Cruiser", 3)
      cell1.place_ship(cruiser)
      cell1.fire_upon

      assert_equal cell1.render(true), "S"
    end

  def test_it_can_render_a_dot
      cell1 = Cell.new("A1")
      cruiser = Ship.new("Cruiser", 3)


      assert_equal ".", cell1.render
    end

    def test_it_can_take_hit_and_decrease_health
      cell1 = Cell.new("A1")
      cruiser = Ship.new("Cruiser", 3)
      cell1.place_ship(cruiser)
      cell1.fire_upon

      assert_equal 2, cell1.ship.health
    end

    def test_it_can_sink_ship
      cell1 = Cell.new("A1")
      cruiser = Ship.new("Cruiser", 3)
      cell1.place_ship(cruiser)
      cell1.fire_upon
      cell1.fire_upon
      cell1.fire_upon

      assert_equal "X", cell1.render
    end

    def test_it_can_show_empty_but_hit
      cell1 = Cell.new("A1")
      cell1.fire_upon

      assert_equal "M", cell1.render
    end

    def test_it_can_show_sunk_ship
      cell1 = Cell.new("A1")
      cruiser = Ship.new("Cruiser", 3)
      cell1.place_ship(cruiser)
      cell1.fire_upon
      cell1.fire_upon
      cell1.fire_upon

      assert_equal true, cell1.sunk?
    end

    def test_it_can_have_2_cells
      cell1 = Cell.new("A1")
      cell2 = Cell.new("A3")

      assert_instance_of Cell, cell2
    end
    
end
