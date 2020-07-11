require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/tutorial'

class Game

  attr_accessor :user_name,
                :computer_board,
                :user_board,
                :comp_cruiser,
                :comp_sub
                :tutorial

  def initialize
    @user_name = user_name
    @computer_board = Board.new
    @user_board = Board.new
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_sub = Ship.new("Submarine", 2)
    @tutorial = Tutorial.new
    computer_board.place(comp_cruiser, ["D2", "D3", "D4"])
    computer_board.place(comp_sub, ["C1", "C2"])
  end

  def make_board_with_players(show=false)
    p "------------------------------------"
    p "Ok, here's the board..."
      sleep(1.5)
    p "*** George ***"
    computer_board.render
    p "-----------------"
    p "*** #{@user_name} ***"
    user_board.render(show)
  end

  def start()
    p "*****************  Welcome to BATTLESHIP  *****************"
    p ""
    p "                   Enter p to Play."
    p "                   Enter r to Read The Rules."
    p "                   Enter q to Quit."
    user_index = gets.chomp!.downcase
    if user_index == "p"
      print "                    You have choosen wisely"
      ".....".each_char do |char|
         print char
         $stdout.flush
         sleep 0.8
        end
        p ""
        puts "------------------------------------"
      puts "You will go head-to-head in a vicious"
      p "game of battleship against the world's"
      p "most formidable opponent... "
      sleep(6.5)
      p ""
      p ""
      p "-------- GEORGE!!! --------"
      sleep(4)
      p "====================================="
      p "Let's start with your name."
      p "What do your homies call you?"
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
      puts "1) The Cruiser, known for it's"
      puts "impeccable speed, with 3 spaces"
      puts "              and   "
      puts "2) the Submarine, known for it's"
      puts "subness, with 2 spaces"
      sleep(8.5)
      puts "------------------------------------"
      print "Now, where would you like your ship to go? Remember"
      "......".each_char do |char|
         print char
         $stdout.flush
         sleep 1
       end
      user_board.cells
      p ""
      puts "1) The ship can't be diagonal"
      puts "2) The ship can't overlap any other ship"
      puts "3) You've gotta make sure it spans the"
      puts "length of the ship, no more, no less."
      puts "ex: a1, a2, a3"
      p "------------------------------------"
      puts "So, where's it gonna go? "
      cruiser = Ship.new("Cruiser", 3)
      user_numbers_first =  gets.chomp!.upcase  # I was able to place it on A3, A4, and A1 unfortunately
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
      sleep(5)
      puts "Now we've gotta let George place his Cruiser."
      print "George is careful. It may take him a minute"
      "........".each_char do |char|
         print char
         $stdout.flush
         sleep 1
       end
       p ""
       puts "==================================="
       sleep(5)
       puts "Here's the board with your cruiser on there"
       puts "Obviously we won't show you George's ship..." #Uh oh! Looks like George's ships are shown here.
       puts "It's not gonna be that easy."
       self.make_board_with_players(true)
       sleep(6)
       puts "Now let's add your Submarine!"
       puts "where would you like that to go?"
       puts "Remember, it only has 2 spaces"
       puts "So, where's it gonna go? "
       user_sub = Ship.new("Submarine", 2)
       user_numbers_second =  gets.chomp!.upcase  # I was able to place it on B1, and B4 unfortunately
       user_numbers2_array = user_numbers_second.split(", ").to_a
       while user_numbers2_array.length != 2
         puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
         puts "Oops! Remember, your coordinates must be"
         puts "2 spaces long. Please give me coordinates"
         puts "such as a1, a2."
         puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
         puts "Let's try again: " #Will pass if ships overap, shouldn't pass
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
       "........".each_char do |char|
          print char
          $stdout.flush
          sleep 1
        end
       sleep(2)
      p ""
      self.make_board_with_players(true)





      # Ended here!!!!
    elsif user_index == "q"
      p "Goodbye!"
    elsif user_index == "r"
      tutorial.start_tutorial
      self.start
    else
      p ""
      p ""
      p "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
      p "|Invalid entry.   Please try again!|"
      p "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
      p ""
      p ""
      self.start
    end


  end


# TODO
# 5) Travis needs to fix some errors in 'place sub ship' (ships are able to overlap)
# 4) game determines who goes first
# 5) player (either before or after computer) inputs first shot fired coord.
# 6) play continues [UNTIL LOOP] until one player's ships are sunk
# 7) Announces winner
# 8) Would you like to play again?

# WISHLIST
# 1) Have a Turn file called inside game.rb to separate the two
# 2) Tutorial file to be called inside game.rb
# 3) Iterate over cells instead of initializing a new cell for 16 cells,
# to make it more dynamic


end

#
# game = Game.new
# game.start
