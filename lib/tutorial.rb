require './lib/ship'
require './lib/cell'
require './lib/board'


class Tutorial

  def initialize(tutorial)
    @tutorial = tutorial
  end

  def continue_rules
    p "Hit 'Enter' or 'Return' once to continue, when you're ready"
    gets
  end

  def start_tutorial
    p "------------------1------------------"
    p "So you've decided to play BATTLESHIP."
    p "Congratulations!"
    p "You're on your way to becoming a"
    p "captain of industry, or at least the"
    p "commander in charge of a small fleet!"
    p "But first, you're going to need to"
    p "learn the ropes (yes, our modern"
    p "warships still use ropes!)."
    p "--*---*---*---*---*---*---*---*---*--"
    sleep(5)
    continue_rules
    p "------------------2------------------"
    p "Battleship consists of two players"
    p "each taking turns attempting to sink"
    p "the other's ship. The problem is,"
    p "you can't see where their ships are!"
    p "Luckily, they can't see where yours"
    p "are either!"
    p "--*---*---*---*---*---*---*---*---*--"
    sleep(5)
    continue_rules
    p "------------------3------------------"
    p "After being asked your name you will"
    p "be presented with your board."
    p "It looks just like this:"
    p "------------------------------------"
    p "--------------example---------------"
    p "*COMPUTER*"
    p "  1 2 3 4 "
    p "A . . . . "
    p "B . . . . "
    p "C . . . . "
    p "D . . . . "
    p "          "
    p "-----------"
    p "**PLAYER**"
    p "  1 2 3 4 "
    p "A . . . . "
    p "B . . . . "
    p "C . . . . "
    p "D . . . . "
    p "          "
    p "--------------example---------------"
    p "--*---*---*---*---*---*---*---*---*--"
    sleep(5)
    continue_rules
    p "------------------4------------------"
    p "You are in command of two ships, the"
    p "valiant Cruiser, and the nobel Submarine."
    p "The Cruiser takes up three(3) spaces,"
    p "and the Submarine takes up two(2)."
    p "They can only be placed on the board"
    p "horizontally, or vertically, and they"
    p "*cannot overlap*. For those trying to"
    p "be sneaky, you should know you are"
    p "also unable to place your ships"
    p "diagonally or off the grid!"
    p "--*---*---*---*---*---*---*---*---*--"
    sleep(5)
    continue_rules
    p "------------------5------------------"
    p "After you've started the game and seen"
    p "the board, we're going to ask you to"
    p "place your Cruiser (we named our's 'Tom'."
    p "Think up a fun name for yours!)."
    p "Don't forget! Your Cruiser is three(3)"
    p "spaces long, so you'll need three"
    p "*consecutive* coordinates!"
    p "That will look like this:"
    p "------------------------------------"
    p "--------------example---------------"
    p "Now, where would you like your ship to go? Remember"
    p "1) The ship can't be diagonal"
    p "2) The ship can't overlap any other ship"
    p "3) You've gotta make sure it spans the"
    p "length of the ship, no more, no less."
    p "ex: a1, a2, a3"
    p "------------------------------------"
    p "So, where's it gonna go?"
    p "   "
    p "--------------example---------------"
    p "--*---*---*---*---*---*---*---*---*--"
    sleep(5)
    continue_rules
    p "------------------6------------------"
    p "Next, we'll show you how the board"
    p "looks now that you've placed your Cruiser:"
    p "------------------------------------"
    p "--------------example---------------"
    p "Ok, here is where your Cruiser has been placed"
    p "-------------------------------"
    p "**PLAYER**"
    p "  1 2 3 4 "
    p "A S S S . "
    p "B . . . . "
    p "C . . . . "
    p "D . . . . "
    p "          "
    p "--------------example---------------"
    p "------------------------------------"
    p "You'll note that the coordinates that"
    p "you entered now have the letter 'S'"
    p "where the '.' used to be! That means"
    p "your ship is now sitting in that"
    p "position! You've done it!"
    p "--*---*---*---*---*---*---*---*---*--"
    sleep(5)
    continue_rules
    p "------------------7------------------"
    p "Next, we'll ask you to place your"
    p "Submarine (which we personally call"
    p "'Renée', but you can think up your"
    p "own fun names on your own. It raises"
    p "the stakes!). The Submarine is only"
    p "two(2) spaces long, so you'll only"
    p "need two consecutive coordinates."
    p "Don't forget! You can place your"
    p "ships horizontally too! Placing your"
    p "Submarine will look like this:"
    p "--*---*---*---*---*---*---*---*---*--"
    sleep(5)
    continue_rules
    p "------------------8------------------"
    p "--------------example---------------"
    p "Here's the board with your cruiser on there"
    p "Obviously we won't show you COMPUTER's ship..."
    p "It's not gonna be that easy."
    p "------------------------------------"
    p "Ok, here's the board..."
    p "*COMPUTER*"
    p "  1 2 3 4 |"
    p "A . . . . |"
    p "B . . . . |"
    p "C . . . . |"
    p "D . . . . |"
    p "-----------------"
    p "**PLAYER**"
    p "  1 2 3 4 |"
    p "A S S S . |"
    p "B . . . . |"
    p "C . . . . |"
    p "D . . . . |"
    p "Now let's add your Submarine!"
    p "where would you like that to go?"
    p "Remember, it only has 2 spaces"
    p "So, where's it gonna go?"
    p "   "
    p "--------------example---------------"
    p "--*---*---*---*---*---*---*---*---*--"
    sleep(5)
    continue_rules
    p "------------------9------------------"
    p "Next, we'll show you how the board"
    p "looks now that you've placed your"
    p "Submarine:"
    p "------------------------------------"
    p "--------------example---------------"
    p "Ok, here's the board..."
    p "*COMPUTER*"
    p "  1 2 3 4 |"
    p "A . . . . |"
    p "B . . . . |"
    p "C . . . . |"
    p "D . . . . |"
    p "-----------------"
    p "**PLAYER**"
    p "  1 2 3 4 |"
    p "A S S S . |"
    p "B . . . . |"
    p "C . . . S |"
    p "D . . . S |"
    p "--------------example---------------"
    p "------------------------------------"
    p "Once again, the coordinates that you"
    p "entered now have the letter 'S' where"
    p "the '.' used to be! Your Submarine"
    p "has been placed! You've done it again!"
    p "--*---*---*---*---*---*---*---*---*--"
    sleep(5)
    continue_rules
    p "------------------10------------------"
    p "Now the fun begins. It is randomly"
    p "determined who goes first, either you"
    p "or the computer, but when it is your"
    p "turn, you're going to 'fire' at the"
    p "computer's ships."
    p "Don't forget! You don't know where"
    p "their ships are, just like they don't"
    p "know where your ships are! Because of"
    p "that, we will show you a print out of"
    p "your ships, and the coordinates"
    p "you've already 'fired' upon."
    p "--*---*---*---*---*---*---*---*---*--"
    sleep(5)
    continue_rules
    p "------------------11------------------"
    p "Before any shots are fired, that will"
    p "look like this:"
    p "------------------------------------"
    p "--------------example---------------"
    p "*COMPUTER*"
    p "  1 2 3 4 "
    p "A . . . . "
    p "B . . . . "
    p "C . . . . "
    p "D . . . . "
    p "          "
    p "-----------"
    p "**PLAYER**"
    p "  1 2 3 4 "
    p "A . . . . "
    p "B . S S S "
    p "C S . . . "
    p "D S . . . "
    p "          "
    p "Don't throw away your shot!"
    p "Where do you want to shoot?"
    p "     "
    p "--------------example---------------"
    p "--*---*---*---*---*---*---*---*---*--"
    sleep(5)
    continue_rules
    p "------------------12------------------"
    p "When you've hit one of the computer's"
    p "ships, the '.' on their board will"
    p "turn into an 'H', for 'Hit!'."
    p "When you've hit every part of the"
    p "computer's ship, the 'H's will be"
    p "replaced with 'X's, indicating that"
    p "you've sunk their ship! If you happen"
    p "to miss their ships, the '.' will be"
    p "replaced with an 'M', for 'Miss'."
    p "You'll see this same pattern on your"
    p "board as the computer attempts to"
    p "sink your ships."
    p "--*---*---*---*---*---*---*---*---*--"
    sleep(5)
    continue_rules
    p "------------------13------------------"
    p "Here is what a game 4 turns in"
    p "could look like:"
    p "------------------------------------"
    p "--------------example---------------"
    p "*COMPUTER*"
    p "  1 2 3 4 "
    p "A M . . H "
    p "B . . . . "
    p "C . X . . "
    p "D . X . . "
    p "-----------"
    p "**PLAYER**"
    p "  1 2 3 4 "
    p "A M . M . "
    p "B . S H S "
    p "C S . M . "
    p "D S . . . "
    p "--------------example---------------"
    p "--*---*---*---*---*---*---*---*---*--"
    sleep(5)
    continue_rules
    p "------------------14------------------"
    p "The game will continue on like this"
    p "until one side's ships have both been"
    p "sunk. When that occurs, you'll know"
    p "whether or not you've truly learned"
    p "the ropes, or if you maybe need to"
    p "try your luck, and try again."
    p "--*---*---*---*---*---*---*---*---*--"
    sleep(5)
    p "------------------------------------"
    p "So, now that you've learned how to play, are you game?"
    p "Can you sink our BATTLESHIPS?"
    p "------------------------------------"
    p "--*---*---*---*---*---*---*---*---*--"

  end
end

rules = Tutorial.new("go")
rules.start_tutorial
#
