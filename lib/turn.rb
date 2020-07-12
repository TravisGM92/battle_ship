require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/tutorial'
require './lib/endgame'
require './lib/game'

class Turn
  attr_accessor :user_name,
                :computer

  $turn_number = 0
  def initialize(user_name, computer)
    @user_name = user_name
    @computer = computer
  end

  def play_game
    while game.user_board.render(true).include? "S"
      if first_move == user_name
        self.make_board_with_players(true)
        puts "Where would you like to fire first?"
        puts "Remember, plese give us a coordinate in this"
        puts "in this format: 'A2' OR 'D3'"
        break
      else
        puts "George will fire first"
        sleep(3)
        self.make_board_with_players(true)
        break
      end
    end
  end
end

# turn = Turn.new
#
# turn.play_game
