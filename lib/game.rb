require './lib/ship'
require './lib/cell'
require './lib/board'



class Game


  def start()
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter i to read the rules Enter q to quit."
    user_index = gets.chomp!.downcase
    if user_index == "p"
      p "Great!"
    elsif user_index == "q"
      p "Goodbye!"
    elsif user_index == "i"
      # put some rules in here at some point
      p "Here are the rules!"
    else
      p "Invalid entry.  Please try again!"
      p "---------------------------------"
      # and then loop back to the beginning of the Game
      self.start
    end


  end

# things we need:
# turns
# way to input Coordinates
#
#
# 1) press play, instantly see the board.
# 2) player places ships
# 3) computer places ships
# 4) game determines who goes first
# 5) player (either before or after computer) inputs first shot fired coord.
# 6) play continues [UNTIL LOOP] until one player's ships are sunk
# 7) Announces winner
# 8) Would you like to play again?
#
#
# instantiate an object and run that.  Rewrite runner
end


game = Game.new
game.start
