require './lib/turn'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/tutorial'
require './lib/endgame'
require './lib/turn'


class Game

  attr_accessor :user_name,
                :computer_board,
                :user_board,
                :comp_cruiser,
                :comp_sub,
                :last_turn,
                :turn_number,
                :second,
                :show

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
  end

  def make_board_with_players(show=false, second=false)
    puts "--------------------"
    puts "Here's the board..."
      sleep(1.5)
    puts "*** George ***"
    computer_board.render(show=false, second)
    puts "-------------"
    puts "*** #{@user_name} ***"
    user_board.render(show=true, second=true)
  end

  def start()
    puts "*****************  Welcome to BATTLESHIP  *****************"
    puts ""
    puts "                   Enter p to Play."
    puts "                   Enter r to Read The Rules."
    puts "                   Enter q to Quit."
    user_index = gets.chomp!.downcase
    if user_index == "p"
      puts "                    You have choosen wisely"
      ".....".each_char do |char|
         print char
         $stdout.flush
         sleep 0.8
        end
      puts ""
      puts "------------------------------------"
      puts "You will go head-to-head in a vicious"
      puts "game of battleship against the world's"
      puts "most formidable opponent... "
      sleep(6.5)
      puts ""
      puts ""
      puts "-------- GEORGE!!! --------"
      sleep(4)
      puts "====================================="
      puts "Let's start with your name."
      puts "What do your homies call you?"
      @user_name = gets.chomp!
      self.make_board_with_players
      sleep(6)
      puts ""
      puts "Let's place your ships. You've got 2 ships"
      "......".each_char do |char|
         print char
         $stdout.flush
         sleep 0.75
       end
      puts ""
      puts "1) The Cruiser, known for it's"
      puts "impeccable speed, with 3 spaces"
      puts "              and   "
      puts "2) the Submarine, known for it's"
      puts "subness, with 2 spaces"
      sleep(8.5)
      puts "------------------------------------"
      puts "Now, where would you like your ship to go? Remember"
      "......".each_char do |char|
         print char
         $stdout.flush
         sleep 1
       end
      user_board.cells
      puts ""
      puts "1) The ship can't be diagonal"
      puts "2) The ship can't overlap any other ship"
      puts "3) You've gotta make sure it spans the"
      puts "length of the ship, no more, no less."
      puts "Example: a1, a2, a3"
      puts "------------------------------------"
      puts "So, where's it gonna go? "
      user_cruiser = Ship.new("Cruiser", 3)
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

      while user_board.valid_placement?(user_cruiser, user_numbers_array) == false
        puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
        puts "Oops! Looks like you put in an invalid placement."
        puts "Try again, except this time make sure the"
        puts "coordinates are one after the other,"
        puts "don't overlap other ships, aren't diagonal,"
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

      puts "==================================="
      puts "Ok, here is where your Cruiser has been placed"
      user_board.cells
      computer_board.cells
      user_board.place(user_cruiser, user_numbers_array)
      puts "------------------------"
      user_board.render(true, true)
      sleep(5)
      puts "Now we've gotta let George place his Cruiser."
      puts "George is careful. It may take him a minute"
      "........".each_char do |char|
         print char
         $stdout.flush
         sleep 1
       end
      puts ""
      puts "==================================="
      sleep(3)
      puts "Here's the board with your cruiser on there"
      puts "Obviously we won't show you George's ship..."
      puts "It's not gonna be that easy."
      self.make_board_with_players(true)
      sleep(6)
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
        puts "such as c4, d4."
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
        puts "don't overlap other ships, aren't diagonal,"
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
      puts ""
      puts "Now we've gotta let George place his Sub,"
      puts "decide who'll go first,"
      puts "and we'll be ready to play!"
       "........".each_char do |char|
          print char
          $stdout.flush
          sleep 1
        end
       sleep(2)
      p ""
      @last_turn = "George"
      # #'d The lines above this and below it go together. I just
      # changed it for now to test things out
      # [user_name, "George"]
      puts ""
      puts "Looks like #{@last_turn} will be going first!"
      puts ""
      sleep(3)

      until (user_sub.health == 0 && user_cruiser.health == 0) || (comp_sub.health == 0 && comp_cruiser.health == 0)

        if last_turn == "George" && turn_number != 0
          self.make_board_with_players(true, true)
          puts "Where would you like to fire?"
          puts "Remember, plese give us a coordinate in this"
          puts "in this format: 'A2' OR 'D3'"
          user_fires = gets.chomp!.upcase

          # board1.cells["B4"].fire_upon
          computer_board.cells[user_fires].fire_upon
          self.make_board_with_players(true, true)
          @last_turn = user_name
          @turn_number += 1
        elsif last_turn == "George" && turn_number == 0
          puts "Georgy's turn"
          computer_options = user_board.cells.keys.shuffle
          user_board.cells[computer_options.shift].fire_upon
          self.make_board_with_players(true, true)
          @last_turn = "George"
          sleep(5)
          @turn_number += 1
        elsif last_turn == user_name && turn_number != 0
          puts "Georgy's turn"
          computer_options = user_board.cells.keys.shuffle
          user_board.cells[computer_options.shift].fire_upon
          self.make_board_with_players(true, true)
          @last_turn = "George"
          sleep(5)
          @turn_number += 1
        elsif last_turn == user_name && turn_number == 0
          self.make_board_with_players(true, true)
          puts "Where would you like to fire?"
          puts "Remember, plese give us a coordinate in this"
          puts "in this format: 'A2' OR 'D3'"
          user_fires = gets.chomp!.upcase
          # board1.cells["B4"].fire_upon
          computer_board.cells[user_fires].fire_upon
          self.make_board_with_players
          @last_turn = user_name
          @turn_number += 1
        end

        if (comp_sub.health == 0 && comp_cruiser.health == 0)
          @endgame.player_wins
          self.start
        elsif (user_sub.health == 0 && user_cruiser.health == 0)
          @endgame.player_loses
          self.start
        end

      end







      # Ended here!!!!
    elsif user_index == "q"
      p "Goodbye!"
    elsif user_index == "r"
      @rules.start_tutorial
      self.start
    else
      puts ""
      puts ""
      puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
      puts "|Invalid entry.   Please try again!|"
      puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
      puts ""
      puts ""
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


# LUKE NOTES
# When I put in q to quit, I have to do it twice for some reason...
# still coming up with this error:
# -----------
# So, where's it gonna go?
# a3, a4, a1
# "==================================="
# Ok, here is where your Cruiser has been placed
# "------------------------"
# "  1 2 3 4 |"
# "A S . S S |"     < this here :/
# "B . . . . |"
# "C . . . . |"
# "D . . . . |"
# Now we've gotta let George place his Cruiser.
# George is careful. It may take him a minute"
# -----------
# - and afterwards I was able to place the sub on a1, a2.
# - It also let me do a1, a2, a4
# - firing on a coord not on the board breaks the game with this error:
# 1: from /Users/lukejames-erickson/turing/battle_ship/battle_ship/battle_ship/lib/game.rb:351:in `<top (required)>'
# /Users/lukejames-erickson/turing/battle_ship/battle_ship/battle_ship/lib/game.rb:249:in `start': undefined method `fire_upon' for nil:NilClass (NoMethodError
# I can't seem to play to the point where computer player_loses
# If you don't put in a coordinate to fire upon and just hit enter, it breaks the Game

end

#
game = Game.new
game.start
