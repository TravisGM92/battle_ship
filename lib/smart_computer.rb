require './lib/cell'
require './lib/ship'
require './lib/game'
require './lib/board'

class Smart

  def initialize
    @board = Board.new
  end

  def options(cell)
    @board.cells[cell]
  end

  def smart_pick
    options("A1")
  end

end


smarts = Smart.new
p smarts.smart_pick
