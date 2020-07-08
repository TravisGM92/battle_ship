require './lib/cell'
require './lib/ship'


class Board

  attr_accessor :row_a, :row_b, :row_b, :row_d, :a1, :a2, :a3, :a4, :b1, :b2, :b3, :b4, :c1, :c2, :c3, :c4, :d1, :d2, :d3, :d4

  def initialize
    @a1 = Cell.new("A1")
      @a2 = Cell.new("A2")
      @a3 = Cell.new("A3")
      @a4 = Cell.new("A4")
      @b1 = Cell.new("B1")
      @b2 = Cell.new("B2")
      @b3 = Cell.new("B3")
      @b4 = Cell.new("B4")
      @c1 = Cell.new("C1")
      @c2 = Cell.new("C2")
      @c3 = Cell.new("C3")
      @c4 = Cell.new("C4")
      @d1 = Cell.new("D1")
      @d2 = Cell.new("D2")
      @d3 = Cell.new("D3")
      @d4 = Cell.new("D4")
  end

  def cells
    {"A1" => a1,
      "A2" => a2,
      "A3" => a3,
      "A4" => a4,
      "B1" => b1,
      "B2" => b2,
      "B3" => b3,
      "B4" => b4,
      "C1" => c1,
      "C2" => c2,
      "C3" => c3,
      "C4" => c4,
      "D1" => d1,
      "D2" => d2,
      "D3" => d3,
      "D4" => d4
    }

  end
  # require "pry"; binding.pry

  def valid_coordinate?(coordinate)
    cells.include? coordinate
  end


  def valid_placement?(ship, coordinate)
    row_a = cells.keys.to_a[0..3]
    row_b = cells.keys.to_a[4..7]
    row_c = cells.keys.to_a[8..11]
    row_d = cells.keys.to_a[12..15]
    rows = []
    rows << row_a
    rows << row_b
    rows << row_c
    rows << row_d
    col_1 = []
    col_1 << cells.keys.to_a[0]
    col_1 << cells.keys.to_a[4]
    col_1 << cells.keys.to_a[8]
    col_1 << cells.keys.to_a[12]
    col_2 = []
    col_2 << cells.keys.to_a[1]
    col_2 << cells.keys.to_a[5]
    col_2 << cells.keys.to_a[9]
    col_2 << cells.keys.to_a[13]
    col_3 = []
    col_3 << cells.keys.to_a[2]
    col_3 << cells.keys.to_a[6]
    col_3 << cells.keys.to_a[10]
    col_3 << cells.keys.to_a[14]
    col_4 = []
    col_4 << cells.keys.to_a[3]
    col_4 << cells.keys.to_a[7]
    col_4 << cells.keys.to_a[11]
    col_4 << cells.keys.to_a[15]

    split_numbs = coordinate.collect{ |coordinates| coordinates.chars}.flatten
    rows_index = split_numbs.select.with_index{ |chars, index| index.even? }
    colum_index = split_numbs.select.with_index{ |chars, index| index.odd? }

    # alpha is an array of alphabet, rows_index is the only the letters of the 
    # coordinates, where colum_index is the numbers of each coordinate
    alpha = ("A".."Z").to_a
    p rows_index.collect{ |letters| alpha.index(letters)}



    # if ship.length <= coordinate.length && split_numbs.each{ |array| array.}
    #
    #     }
    #   true
    # else
    #   false
    # end

  end


end

board1 = Board.new
cruiser = Ship.new("Cruiser", 3)
board1.cells
# board1.valid_placement?("Cruiser", )


board1.valid_placement?(cruiser, ["A2", "D4", "C2"])
