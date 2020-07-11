require './lib/ship'
require './lib/cell'
require './lib/board'

#If we have time we should at the end "Congratulations #{name}!  You sunk our battleships!"

class Game

  attr_accessor :user_name, :computer_board, :user_board, :comp_cruiser,
                :comp_sub

  def initialize
    @user_name = user_name
    @computer_board = Board.new
    @user_board = Board.new
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_sub = Ship.new("Submarine", 2)
    computer_board.place(comp_cruiser, ["D2", "D3", "D4"])
    computer_board.place(comp_sub, ["C1", "C2"])
  end

  def make_board_with_players(show=false)
    p "Ok, here's the board..."
    # sleep(1.5)
    p "*** George ***"
    computer_board.render(show)
    p "-----------------"
    p "*** #{@user_name} ***"
    user_board.render(show)
    end

  def start()
    p "*****************  Welcome to BATTLESHIP  *****************"
    p ""
    p "                   Enter p to Play."
    p "                   Enter i to read The Rules."
    p "                   Enter q to Quit."
    user_index = gets.chomp!.downcase
    if user_index == "p"
      print "                    You have choosen wisely"
      # ".....".each_char do |char|
      #    print char
      #    $stdout.flush
      #    sleep 0.8
      #   end
        p ""
        puts "------------------------------------"
      puts "You will go head-to-head in a vicious"
      p "game of battleship against the world's"
      p "most formidable opponent... "
      # sleep(6.5)
      p ""
      p ""
      p "-------- GEORGE!!! --------"
      # sleep(4)
      p "====================================="
      p "Let's start with your name."
      p "What do your homies call you?"
      @user_name = gets.chomp!
      self.make_board_with_players
      # sleep(6)
      p ""
      print "Let's place your ships. You've got 2 ships"
      # "......".each_char do |char|
      #    print char
      #    $stdout.flush
      #    sleep 0.75
      #  end
      p ""
      puts "1) The Cruiser, known for it's"
      puts "impeccable speed, with 3 spaces"
      puts "      and   "
      puts "2) the Submarine, known for it's"
      puts "subness, with 2 spaces"
      # sleep(8.5)
      puts "------------------------------------"
      print "Now, where would you like your ship to go? Remember"
      # "......".each_char do |char|
      #    print char
      #    $stdout.flush
      #    sleep 1
      #  end
      user_board.cells
      p ""
      puts "1) The ship can't be diagonal"
      puts "2) The ship can't overlap any other ship"
      puts "3) You've gotta make sure it spans the"
      puts "length of the ship, no more, no less."
      p "------------------------------------"
      puts "So, where's it gonna go? "
      cruiser = Ship.new("Cruiser", 3)
      user_numbers_first =  gets.chomp!.upcase
      user_numbers_array = user_numbers_first.split(", ").to_a
      while user_numbers_array.length != 3
        puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
        puts "Oops! Remember, your coordaintes must be"
        puts "3 spaces long. Please give me coordinates"
        puts "such as a1, a2, a3."
        puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
        puts "Let's try again: "
        user_numbers_first =  gets.chomp!.upcase
        user_numbers_array = user_numbers_first.split(", ").to_a
      end

      while user_board.valid_placement?(cruiser, user_numbers_array) == false
        puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
        puts "Oops! Looks like you put in an invalid placement."
        puts "Try again, except this time make sure the"
        puts "coordinates are one after the other,"
        puts "don't, overlap other ships, aren't diagonal,"
        puts "and don't pass the edge"
        puts "of the board... "
        puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
        puts "Let's try again: "
        user_numbers_first =  gets.chomp!.upcase
        user_numbers_array = user_numbers_first.split(", ").to_a
        if user_board.valid_placement?(cruiser, user_numbers_array) == true
          break
        end
      end

      p "==================================="
      puts "Ok, here is where your Cruiser has been placed"
      user_board.cells
      user_board.place(cruiser, user_numbers_array)
      p "-------------------------------"
      user_board.render(true)
      # sleep(5)
      puts "Now we've gotta let George place his Cruiser."
      print "George is old. It may take him a minute"
      # "........".each_char do |char|
      #    print char
      #    $stdout.flush
      #    sleep 1
      #  end
       p ""
       puts "==================================="
       puts "Here's the board with your cruiser on there"
       puts "Obviously we won't show you George's ship..."
       puts "It's not gonna be that easy."
       self.make_board_with_players(true)
       # sleep(6)
       puts "Now let's add your Submarine!"
       puts "where would you like that to go?"
       puts "Remember, it only has 2 spaces"
       puts "So, where's it gonna go? "
       user_sub = Ship.new("Submarine", 2)
       user_numbers_second =  gets.chomp!.upcase
       user_numbers2_array = user_numbers_second.split(", ").to_a
       while user_numbers2_array.length != 2
         puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
         puts "Oops! Remember, your coordinates must be"
         puts "3 spaces long. Please give me coordinates"
         puts "such as a1, a2, a3."
         puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
         puts "Let's try again: "
         user_numbers_second =  gets.chomp!.upcase
         user_numbers2_array = user_numbers_second.split(", ").to_a
       end

       while user_board.valid_placement?(user_sub, user_numbers2_array) == false
         puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
         puts "Oops! Looks like you put in an invalid placement."
         puts "Try again, except this time make sure the"
         puts "coordinates are one after the other,"
         puts "don't, overlap other ships, aren't diagonal,"
         puts "and don't pass the edge"
         puts "of the board... "
         puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
         puts "Let's try again: "
         user_numbers_second =  gets.chomp!.upcase
         user_numbers2_array = user_numbers_second.split(", ").to_a
         if user_board.valid_placement?(user_sub, user_numbers2_array) == true
           break
         end
       end
       user_board.cells
       user_board.place(user_sub, user_numbers2_array)
       self.make_board_with_players(true)
       puts "How's it look?"
       puts "Now we've gotta let George place his Sub"
       print "and we'll be ready to play!"
       # "........".each_char do |char|
       #    print char
       #    $stdout.flush
       #    sleep 1
       #  end
       sleep(2)
      p ""
      self.make_board_with_players(true)





      # Ended here!!!!
    elsif user_index == "q"
      p "Goodbye!"
    elsif user_index == "i"
      p "So you've decided to play BATTLESHIP."
      p "Congratulations!"
      p "You're on your way to becoming a"
      p "captain of industry, or at least the"
      p "commander in charge of a small fleet!"
      p "But first, you're going to need to"
      p "learn the ropes (yes, our modern"
      p "warships still use ropes!)."
      p "------------------------------------"
      sleep(5)
      p "Hit 'Enter' when you're ready to continue"
      # some sort of something to act on the above `user_index2 = gets.chomp!` ?
      p "------------------------------------"
      p "Battleship consists of two players"
      p "each taking turns attempting to sink"
      p "the other's ship. The problem is,"
      p "you can't see where their ships are!"
      p "Luckily, they can't see where yours"
      p "are either!"
      p "------------------------------------"
      sleep(5)
      p "Hit 'Enter' when you're ready to continue"
      p "------------------------------------"
      # same thing as above
      p "After being asked your name you will"
      p "be presented with your board."
      p "It looks just like this:"
      p "------------------------------------"
      p "--------------example---------------"
      p "**PLAYER**"
      p "  1 2 3 4 "
      p "A . . . . "
      p "B . . . . "
      p "C . . . . "
      p "D . . . . "
      p "          "
      p "--------------example---------------"
      p "------------------------------------"
      sleep(5)
      p "Hit 'Enter' when you're ready to continue"
      p "------------------------------------"
      # same thing as above
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
      p "------------------------------------"
      sleep(5)
      p "Hit 'Enter' when you're ready to continue"
      p "------------------------------------"
      # same thing as above
      p "When you start the game, we're going"
      p "to show you the board again, and ask"
      p "you to place your Cruiser (we named"
      p "our's 'Tom'. Think up a fun name for"
      p "yours!). Don't forget! Your Cruiser"
      p "is three(3) spaces long, so you'll"
      p "need three *consecutive* coordinates!"
      p "That will look like this:"
      p "------------------------------------"
      p "--------------example---------------"
      p "          "
      p "  1 2 3 4 "
      p "A . . . . "
      p "B . . . . "
      p "C . . . . "
      p "D . . . . "
      p "          "
      p "Where would you like to place your"
      p "Cruiser? It's got 3 spaces. We'll"
      p "first decide where the front of the"
      p "ship will be."
      p "Please give me the coordinates of"
      p "where you'd like your the ship to be"
      p "(for example, B2, B3, B4): "
      # SOME SORT OF GETS
      p "--------------example---------------"
      p "------------------------------------"
      sleep(5)
      p "Hit 'Enter' when you're ready to continue"
      p "------------------------------------"
      # same thing as above
      p "Next, we'll show you how the board"
      p "looks now that you've placed your Cruiser:"
      p "------------------------------------"
      p "--------------example---------------"
      p "**PLAYER**"
      p "  1 2 3 4 "
      p "A . . . . "
      p "B . S S S "
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
      p "------------------------------------"
      sleep(5)
      p "Hit 'Enter' when you're ready to continue"
      p "------------------------------------"
      # same thing as above
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
      p "------------------------------------"
      p "--------------example---------------"
      p "**PLAYER**"
      p "  1 2 3 4 "
      p "A . . . . "
      p "B . S S S "
      p "C . . . . "
      p "D . . . . "
      p "          "
      p "Where would you like to place your"
      p "Submarine? It's got 2 spaces. We'll"
      p "first decide where the front of the"
      p "ship will be."
      p "Please give me the coordinates of"
      p "where you'd like your the ship to be"
      p "(for example, C1, D1): "
      # *** We'll put whatever your queries look like Here too
      p "--------------example---------------"
      p "------------------------------------"
      sleep(5)
      p "Hit 'Enter' when you're ready to continue"
      p "------------------------------------"
      # same thing as above
      p "Next, we'll show you how the board"
      p "looks now that you've placed your"
      p "Submarine:"
      p "------------------------------------"
      p "--------------example---------------"
      p "**PLAYER**"
      p "  1 2 3 4 "
      p "A . . . . "
      p "B . S S S "
      p "C S . . . "
      p "D S . . . "
      p "          "
      p "--------------example---------------"
      p "------------------------------------"
      p "Once again, the coordinates that you"
      p "entered now have the letter 'S' where"
      p "the '.' used to be! Your Submarine"
      p "has been placed! You've done it again!"
      p "------------------------------------"
      sleep(5)
      p "Hit 'Enter' when you're ready to continue"
      p "------------------------------------"
      # same thing as above
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
      p "------------------------------------"
      sleep(5)
      p "Hit 'Enter' when you're ready to continue"
      p "------------------------------------"
      # same thing as above
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
      #p "Whatever you've put here that prompts the user to put in their first/next shot"
      p "--------------example---------------"
      p "------------------------------------"
      sleep(5)
      p "Hit 'Enter' when you're ready to continue"
      p "------------------------------------"
      # same thing as above
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
      p "------------------------------------"
      sleep(5)
      p "Hit 'Enter' when you're ready to continue"
      p "------------------------------------"
      # same thing as above
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
      #p "Whatever you've put here that prompts the user to put in their first/next shot"
      p "--------------example---------------"
      p "------------------------------------"
      sleep(5)
      p "Hit 'Enter' when you're ready to continue"
      p "------------------------------------"
      # same thing as above
      p "The game will continue on like this"
      p "until one side's ships have both been"
      p "sunk. When that occurs, you'll know"
      p "whether or not you've truly learned"
      p "the ropes, or if you maybe need to"
      p "try your luck, and try again."
      p "------------------------------------"
      sleep(5)
      p "------------------------------------"
      p "So, now that you've learned how to play, are you game?"
      p "Can you sink our BATTLESHIPS?"
      p "------------------------------------"
      p "*****************  Welcome to BATTLESHIP  *****************"
      p "Enter p to Play."
      p "Enter i to read The Rules."
      p "Enter q to Quit."
        user_index = gets.chomp!.downcase
        if user_index == "p"
            #somehow loops back to the play option above
        elsif user_index == "i"
            #somehow loops back to the rules option again
        elsif user_index == "q"
          p "Goodbye!"
        else
          p ""
          p ""
          p "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
          p "Invalid entry.  Please try again!"
          p "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
          p ""
          p ""
          self.start
        end
    else
      p ""
      p ""
      p "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
      p "Invalid entry.  Please try again!"
      p "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
      p ""
      p ""
      self.start
    end


  end

# things we need:
# turns
# way to input Coordinates
#
# TODO
# 1) press play, instantly see the board. (DONE)
# 2) player places ships (First ship, done)
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
