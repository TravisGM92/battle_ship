require './lib/ship'

class Cell


  attr_reader :coordinate
  attr_accessor :cell, :fired

  def initialize(coordinate, cell=[], fired=0)
    @coordinate = coordinate
    @cell = cell
    @fired = fired

  end

  def ship
    if empty?
      nil
    else
      cell[0]
    end
  end

  def empty?
    cell.empty?
  end

  def place_ship(name)
    cell << name
  end

  def fired_upon?
    @fired > 0
  end

  def fire_upon
    if cell.empty? == false
      $hits += 1
    end
    @fired += 1
  end

  def render(show=false, second=false)

    if fired > 0 && cell.empty? && show == false
      "M"
    elsif fired > 0 && cell.empty? == false && show == false && ship.health > 0
      "H"
    # elsif fired == 0 && cell.empty? && show == false
    #   "." Seems like we don't need this
    elsif cell.empty? == false && show == true && second != true
      "S"
    elsif cell.empty? == false && show == true && second == true && fired == 0
      "S"
    elsif fired > 0 && cell.empty? && show == true && second == true
      "M"
    elsif fired > 0 && cell.empty? == false && show == true && second == true && ship.health > 0
      "H"
    elsif fired == 0 && cell.empty? && show == true && second == true
      "."
    elsif cell.empty? == false && ship.health == 0
      "X"
    else
      "."
    end
  end

  def sunk?
    ship.health == 0
  end
end

# cell = Cell.new("B4")
# cruiser = Ship.new("Cruiser", 3)
# cell.place_ship(cruiser)
# cell.fire_upon
# p cell.ship.health
