require './lib/ship'
require './lib/cell'
require './lib/board'



class Game

  attr_accessor :user_name, :computer_board, :user_board

  def initialize
    @user_name = user_name
    @computer_board = Board.new
    @user_board = Board.new
  end

  def make_board_with_players
    p "Ok, here's the board..."
    sleep(1.5)
    p "*** George ***"
    computer_board.render
    p "------------------------------------"
    p "*** #{@user_name} ***"
    user_board.render
    end

  def start()
    p "*****************  Welcome to BATTLESHIP  *****************"
    p "Enter p to play. Enter i to read the rules Enter q to quit."
    user_index = gets.chomp!.downcase
    if user_index == "p"
      print "You have choosen wisely"
      ".....".each_char do |char|
         print char
         $stdout.flush
         sleep 0.8
        end
        p ""
        puts "------------------------------------"
      puts "You will go head-to-head in a vicious game of battleship against the world's most formidable opponent... "
      sleep(5.5)
      p "GEORGE!!!"
      sleep(2)
      p "------------------------------------"
      p "Let's start with your name. What do your homies call you?"
      @user_name = gets.chomp!
      self.make_board_with_players
      sleep(6)
      p ""
      print "Let's place your ships. You've got 2 ships"
      "......".each_char do |char|
         print char
         $stdout.flush
         sleep 0.75
       end
       p ""
      puts "1) The Cruiser (known for it's impeccable speed, with 3 spaces), and"
      puts "2) the Sub (known for it's subness, with 2 spaces)"
      sleep(8.5)
      p "------------------------------------"
      p "Where would you like to place your cruiser? It's got 3 spaces. We'll first decide where the front of the ship will be."
      sleep(4)
      p  "Please give me the coordinates of where you'd like your the ship to be (for example, A1, A2, A3): "
      print "Sweetness! Now, where would you like the back to be? Remember"
      "......".each_char do |char|
         print char
         $stdout.flush
         sleep 1
       end
      puts ""
      puts "1) The ship can't be diagonal"
      puts "2) The ship can't be overlapping any other ship"
      puts "3) You've gotta make sure it spans the length of the ship, no more, no less."
      puts "So, where's it gonna go? "
      cruiser = Ship.new("Cruiser", 3)
      ship_coordiantes1 = []
      user_numbers1 =  gets.chomp!
      p user_numbers1.split(", ")
      # Ended here!!!!


    elsif user_index == "q"
      p "Goodbye!"
    elsif user_index == "i"
      # put some rules in here at some point
      p "Here are the rules!"
    else
      p "Invalid entry.  Please try again!"
      p "------------------------------------"
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
