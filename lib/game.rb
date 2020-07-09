require './lib/ship'
require './lib/cell'
require './lib/board'

#If we have time we should ask for the player to put in their own name, so that at the end, it says "Congratulations #{name}!  You sunk our battleships!"

class Game


  def start()
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter i to read the rules. Enter q to quit."
    user_index = gets.chomp!.downcase
    if user_index == "p"
      p "Great!"
    elsif user_index == "q"
      p "Goodbye!"
    elsif user_index == "i"
      # put some rules in here at some point
      p "Here are the rules!"
      p "So you've decided to play BATTLESHIP. \n Congratulations! \n You're on your way to becoming a captain of industry, or at least the commander in charge of a small fleet! \n But first, you're going to need to learn the ropes (yes, our modern warships still use ropes!). \n"
      sleep(5)
      p "Battleship consists of two players each taking turns attempting to sink the other's ship. \n  The problem is, you can't see where their ships are! \n Luckily, they can't see where yours are either. \n"
      sleep(5)
      p "First, you will be presented with your board. \n  It looks just like this: \n"
      p "  1 2 3 4 \n" +
      "A . . . . \n" +
      "B . . . . \n" +
      "C . . . . \n" +
      "D . . . . \n"
      sleep(5)
      p "Hit 'Enter' when you're ready to continue"
      # some sort of something to act on the above `user_index2 = gets.chomp!` ?
      p "You are in command of two ships, the valiant Cruiser, and the nobel Submarine. \n The Cruiser takes up three(3) spaces, and the Submarine takes up two(2). \n They can only be placed on the board horizontally, or vertically, and they cannot overlap. \n For those trying to be sneaky, you should know you are also unable to place your ships diagonally or off the grid! \n"
      sleep(5)
      p "When you start the game, we're going to show you the board again, and ask you to place your Cruiser (we name our's 'Tom'. Think up a fun name for yours!). \n Don't forget! Your Cruiser is three(3) spaces long, so you'll need three consequtive coordinates! \n That will look like this: \n "
      p "---------------"
      p "  1 2 3 4 \n" +
      "A . . . . \n" +
      "B . . . . \n" +
      "C . . . . \n" +
      "D . . . . \n"
      # *** We'll put whatever your queries look like Here
      p "---------------"
      sleep(5)
      p "Hit 'Enter' when you're ready to continue"
      # same thing as above
      p "Next, we'll show you how the board looks now that you've placed your Cruiser:"
      p "  1 2 3 4 \n" +
      "A . . . . \n" +
      "B . S S S \n" +
      "C . . . . \n" +
      "D . . . . \n"
      p "You'll note that the coordinates that you entered now have the letter 'S' where the '.' used to be! \n That means your ship is now sitting in that position! \n You've done it!"
      sleep(5)
      p "\n Next, we'll ask you to place your Submarine (which we personally call 'Renée', but you can think up your own fun names on your own. It raises the stakes!). \n  The Submarine is only two(2) spaces long, so you'll only need two consecutive coordinates. \n Don't forget! You can place your ships horizontally too! \n  Placing your Submarine will look like this:"
      p "---------------"
      p "  1 2 3 4 \n" +
      "A . . . . \n" +
      "B . S S S \n" +
      "C . . . . \n" +
      "D . . . . \n"
      # *** We'll put whatever your queries look like Here too
      p "---------------"
      sleep(5)
      p "Hit 'Enter' when you're ready to continue"
      # same thing as above
      p "Next, we'll show you how the board looks now that you've placed your Submarine:"
      p "  1 2 3 4 \n" +
      "A . . . . \n" +
      "B . S S S \n" +
      "C S . . . \n" +
      "D S . . . \n"
      p "Once again, the coordinates that you entered now have the letter 'S' where the '.' used to be! \n Your Submarine has been placed! \n You've done it again!"
      sleep(5)
      p "Hit 'Enter' when you're ready to continue"
      # same thing as above
      p "Now the fun begins. \n It is randomly determined who goes first, either you or the computer, but when it is your turn, you're going to 'fire' at the computer's ships. \n Don't forget!  You don't know where their ships are, just like they don't know where your ships are! \n Because of that, we will show you a print out of your ships, and the coordinates you've already 'fired' upon. \n Before any shots are fired, that will look like this:"
      p "---------------"
      p "COMPUTER"
      p "  1 2 3 4 \n" +
      "A . . . . \n" +
      "B . . . . \n" +
      "C . . . . \n" +
      "D . . . . \n"
      p "-----------"
      p "PLAYER" +
      "  1 2 3 4 \n" +
      "A . . . . \n" +
      "B . S S S \n" +
      "C S . . . \n" +
      "D S . . . \n"
      #p "Whatever you've put here that prompts the user to put in their first/next shot"
      p "---------------"
      sleep(5)
      p "Hit 'Enter' when you're ready to continue"
      # same thing as above
      p "When you've hit one of the computer's ships, the '.' on their board will turn into an 'H', for 'Hit!'. \n When you've hit every part of the computer's ship, the 'H's will be replaced with 'X's, indicating that you've sunk their ship! \n If you happen to miss their ships, the '.' will be replaced with an 'M', for 'Miss'. \n You'll see this same pattern on your board as the computer attempts to sink your ships. \n here is what a game 2 turns in could look like:"
      p "---------------"
      p "COMPUTER"
      p "  1 2 3 4 \n" +
      "A M . . . \n" +
      "B . . . . \n" +
      "C . X . . \n" +
      "D . X . . \n"
      p "-----------"
      p "PLAYER" +
      "  1 2 3 4 \n" +
      "A M . M . \n" +
      "B . S H S \n" +
      "C S . M . \n" +
      "D S . . . \n"
      #p "Whatever you've put here that prompts the user to put in their first/next shot"
      p "---------------"
      sleep(5)
      p "Hit 'Enter' when you're ready to continue"
      # same thing as above
      p "The game will continue on like this until one side's ships have both been sunk. \n  When that occurs, you'll know whether or not you've truly learned the ropes, or if you maybe need to try your luck, and try again."
      sleep(5)
      p "So, now that you've learned, how to play, are you game? \n Can you sink our BATTLESHIPS?"
      p "---------------------------------"
      p "Enter p to play. Enter i to read the rules again. Enter q to quit."
        user_index = gets.chomp!.downcase
        if user_index == "p"
            #somehow loops back to the play option above
        elsif user_index == "i"
            #somehow loops back to the rules option again
        elsif user_index == "q"
          p "Goodbye!"
        else
          p "Invalid entry.  Please try again!"
          p "---------------------------------"
          self.start
        end
    else
      p "Invalid entry.  Please try again!"
      p "---------------------------------"
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
