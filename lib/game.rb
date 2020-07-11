require './lib/turn'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/tutorial'
require './lib/endgame'
require './lib/turn'


# somewhere in there will be something like:
#
# if (something something Player wins)
#   @endgame.player_wins
#   self.start
# elsif (something something player loses)
#   @endgame.player_loses
#   self.start
# else
#   p "Well this is embarassing. We're frankly not sure what happened here.  Maybe Rhinana from the award winning film Battleship (2012) somehow hacked into the Gibson and sunk everyone's ships?"
#   p "Do ... do you wanna see if it happens again?"
# end

class Game

  attr_accessor :user_name,
                :computer_board,
                :user_board,
                :comp_cruiser,
                :comp_sub,
                :last_turn,
                :turn_number,
                :second,
                :show,
                :winner,
                :loser,
                :user_fires

  def initialize
    @user_name = user_name
    @computer_board = Board.new
    @user_board = Board.new
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_sub = Ship.new("Submarine", 2)
    @rules = Tutorial.new("The Rules")
    @endgame = Endgame.new("The End")
    computer_board.place(comp_cruiser, ["D2", "D3", "D4"])
    computer_board.place(comp_sub, ["C1", "C2"])
    @last_turn = last_turn
    @turn_number = 0
    @show = show
    @second = second
    @winner = winner
    @loser = loser
    @user_fires = user_fires
  end

  def make_board_with_players(show=false, second=false)
    p "--------------------"
    p "Here's the board..."
      # sleep(1.5)
    p "*** George ***"
    computer_board.render(show=false, second)
    p "-------------"
    p "*** #{@user_name} ***"
    user_board.render(show=true, second=true)
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
      puts "              and   "
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
      puts "ex: a1, a2, a3"
      p "------------------------------------"
      puts "So, where's it gonna go? "
      user_cruiser = Ship.new("Cruiser", 3)
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

      while user_board.valid_placement?(user_cruiser, user_numbers_array) == false
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
        if user_board.valid_placement?(user_cruiser, user_numbers_array) == true
          break
        end
      end

      p "==================================="
      puts "Ok, here is where your Cruiser has been placed"
      user_board.cells
      computer_board.cells
      user_board.place(user_cruiser, user_numbers_array)
      p "------------------------"
      user_board.render(true, true)
      # sleep(5)
      puts "Now we've gotta let George place his Cruiser."
      print "George is careful. It may take him a minute"
      # "........".each_char do |char|
      #    print char
      #    $stdout.flush
      #    sleep 1
      #  end
       p ""
       puts "==================================="
       # sleep(3)
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
         puts "2 spaces long. Please give me coordinates"
         puts "such as a1, a2."
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
         user_sub = Ship.new("Submarine", 2)
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
       p ""
       puts "Now we've gotta let George place his Sub,"
       puts "decide who'll go first,"
       print "and we'll be ready to play!"
      #  "........".each_char do |char|
      #     print char
      #     $stdout.flush
      #     sleep 1
      #   end
      #  sleep(2)
      # p ""
      @last_turn = user_name
      # The lines above this and below it go together. I just
      # changed it for now to test things out
      # [user_name, "George"]
      p ""
      p "Looks like #{@last_turn} will be going first!"
      p ""
      sleep(3)
      computer_options = user_board.cells.keys.shuffle

    until (user_sub.health == 0 && user_cruiser.health == 0) || (comp_sub.health == 0 && comp_cruiser.health == 0)
      if last_turn == "George" && turn_number != 0
        self.make_board_with_players(true, true)
        puts "1Where would you like to fire?"
        puts "Remember, plese give us a coordinate in this"
        puts "in this format: 'A2' OR 'D3'"
        @user_fires = gets.chomp!.upcase
          until user_board.valid_coordinate?([user_fires]) == true
            puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
            puts "Oops! Your coordinate must be"
            puts "1 space long. Please give me coordinates"
            puts "such as 'a1' or 'c3'."
            puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
            puts "Let's try again: "
            @user_fires = gets.chomp!.upcase
          end
            # board1.cells["B4"].fire_upon
            computer_board.cells[user_fires].fire_upon
            self.make_board_with_players(true, true)
            @last_turn = user_name
            @turn_number += 1
        elsif last_turn == "George" && turn_number == 0
        puts "2Georgy's turn"
        user_board.cells[computer_options.pop].fire_upon
        self.make_board_with_players(true, true)
        @last_turn = "George"
        sleep(5)
        @turn_number += 1
      elsif last_turn == user_name && turn_number != 0
        puts "1Georgy's turn"
        user_board.cells[computer_options.pop].fire_upon
        self.make_board_with_players(true, true)
        @last_turn = "George"
        sleep(5)
        @turn_number += 1
      elsif last_turn == user_name && turn_number == 0
        self.make_board_with_players(true, true)
        puts "2Where would you like to fire?"
        puts "Remember, plese give us a coordinate in this"
        puts "in this format: 'A2' OR 'D3'"
        @user_fires = gets.chomp!.upcase
        if user_board.valid_coordinate?([user_fires]) == false
          until user_board.valid_coordinate?([user_fires]) == true
            puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
            puts "Oops! Your coordinate must be"
            puts "1 space long. Please give me coordinates"
            puts "such as 'a1' or 'c3', and you can't fired on a"
            puts "you've already fired on."
            puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
            puts "Let's try again: "
            @user_fires = gets.chomp!.upcase
            end
          end
        # board1.cells["B4"].fire_upon
        computer_board.cells[user_fires].fire_upon
        self.make_board_with_players(true, true)
        @last_turn = user_name
        @turn_number += 1
      end
    end







      # Ended here!!!!
    elsif user_index == "q"
      p "Goodbye!"
    elsif user_index == "r"
      @rules.start_tutorial
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

# 1) Announces winner
# 8) Would you like to play again?


# WISHLIST

# 1) Have a Turn file called inside game.rb to separate the two
# 2) Tutorial file to be called inside game.rb
# 3) Iterate over cells instead of initializing a new cell for 16 cells,
# to make it more dynamic
# 4) Get rid of the " " around the sentences
# 2) Be able to name the computer?
# 3) Iterate over cells instead of initializing a new cell for 16 cells, to make it more dynamic


end

#
game = Game.new
game.start
