require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/tutorial'
require './lib/endgame'
require './lib/game_words'
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
                :show,
                :user_fires

  def initialize
    @user_name = user_name
    @computer_board = Board.new
    @user_board = Board.new
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_sub = Ship.new("Submarine", 2)
    @rules = Tutorial.new("The Rules")
    @endgame = Endgame.new("The End")
    @game_words = GameWords.new("Words") #I named it GameWords because GameText was too close to GameTest
    @last_turn = last_turn
    @turn_number = 0
    @show = show
    @second = second
    @user_fires = user_fires
  end

  def make_board_with_players(show=false, second=false)
    puts "--------------------"
    puts "Here's the board..."
    sleep(1.5)
    puts ""
    puts "*** George ***"
    computer_board.render(show=false, second)
    puts "-------------"
    puts "*** #{@user_name} ***"
    user_board.render(show=true, second=true)
  end

  def start()
    sub_cord = computer_board.valid_placement_for_sub(comp_sub)
    computer_board.place(comp_sub, sub_cord)
    cruise_cord = computer_board.valid_placement_for_cruiser(comp_cruiser)
    computer_board.place(comp_cruiser, cruise_cord)
    @game_words.game_opening
    # puts "*****************  Welcome to BATTLESHIP  *****************"
    # puts ""
    # puts "                   Enter p to Play."
    # puts "                   Enter r to Read The Rules."
    # puts "                   Enter q to Quit."
    user_index = gets.chomp!.downcase
    if user_index == "p"
      @game_words.comp_intro
      # print "                   You have choosen wisely"
      # ".....".each_char do |char|
      #    print char
      #    $stdout.flush
      #    sleep 0.8
      #   end
      # puts ""
      # puts ""
      # puts "------------------------------------"
      # puts "You will go head-to-head in a vicious"
      # puts "game of battleship against the world's"
      # puts "most formidable opponent... "
      # sleep(6.5)
      # puts ""
      # puts ""
      # puts "-------->        GEORGE!!!        <--------"
      # sleep(4)
      # puts ""
      # puts "====================================="
      # puts "Let's start with your name."
      # puts "What do your homies call you?"
      @user_name = gets.chomp!
      self.make_board_with_players
      @game_words.ship_intro
      # sleep(6)
      # puts ""
      # print "Let's place your ships. You've got 2 ships"
      # "......".each_char do |char|
      #    print char
      #    $stdout.flush
      #    sleep 0.75
      #  end
      # puts ""
      # puts ""
      # puts "1) The Cruiser, known for it's"
      # puts "impeccable speed, with 3 spaces"
      # puts "              and   "
      # puts "2) the Submarine, known for it's"
      # puts "subness, with 2 spaces"
      # sleep(9.5)
      # puts "------------------------------------"
      # print "Now, where would you like your cruiser to go? Remember"
      # "......".each_char do |char|
      #    print char
      #    $stdout.flush
      #    sleep 1
      # end
      user_board.cells
      @game_words.cruiser_placement_prompt
      # puts ""
      # puts ""
      # puts "1) The ship can't be diagonal"
      # puts "2) The ship can't overlap any other ship"
      # puts "3) You've gotta make sure it spans the"
      # puts "   length of the ship, no more, no less."
      # puts "Example: a1, a2, a3"
      # puts "------------------------------------"
      # puts "So, where's it gonna go? "
      user_cruiser = Ship.new("Cruiser", 3)

      user_numbers_first =  gets.chomp!.upcase
      user_numbers_array = user_numbers_first.split(", ").to_a.sort!
      while user_numbers_array.length != 3
        @game_words.oops_bad_cruiser_coordinates
        # puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
        # puts "Oops! Remember, your coordaintes must be"
        # puts "3 spaces long. Please give me coordinates"
        # puts "such as a1, a2, a3."
        # puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
        # puts "Let's try again: "
        user_numbers_first =  gets.chomp!.upcase
        user_numbers_array = user_numbers_first.split(", ").to_a.sort!
      end

      while user_board.valid_placement?(user_cruiser, user_numbers_array) == false
        @game_words.oops_bad_cruiser_overlap
        # puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
        # puts "Oops! Looks like you put in an invalid placement."
        # puts "Try again, except this time make sure the"
        # puts "coordinates are one after the other,"
        # puts "don't overlap other ships, aren't diagonal,"
        # puts "and don't pass the edge"
        # puts "of the board... "
        # puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
        # puts "Let's try again: "
        user_numbers_first =  gets.chomp!.upcase
        user_numbers_array = user_numbers_first.split(", ").to_a.sort!
      end
      @game_words.cruiser_has_been_placed
      # puts "==================================="
      # puts "Ok, here is where your Cruiser has been placed"
      user_board.cells
      computer_board.cells
      user_board.place(user_cruiser, user_numbers_array)
      @game_words.george_placing_cruiser
      # puts "----------------------------"
      # user_board.render(true, true)
      # sleep(5)
      # puts "Now we've gotta let George place his Cruiser."
      # print "George is careful. It may take him a minute"
      # "........".each_char do |char|
      #    print char
      #    $stdout.flush
      #    sleep 1
      #  end
      # puts ""
      # puts "==================================="
      # sleep(2)
      # puts "Here's the board with your cruiser on there"
      # puts "Obviously we won't show you George's ship..."
      # puts "It's not gonna be that easy."
      self.make_board_with_players(true)
      @game_words.add_submarine_prompt
      # sleep(6)
      # puts "Now let's add your Submarine!"
      # puts "where would you like that to go?"
      # puts "Remember, it only has 2 spaces"
      # puts "So, where's it gonna go? "
      user_sub = Ship.new("Submarine", 2)
      user_numbers_second =  gets.chomp!.upcase
      user_numbers2_array = user_numbers_second.split(", ").to_a.sort!
      while user_numbers2_array.length != 2
        @game_words.oops_bad_sub_coordinates
        # puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
        # puts "Oops! Remember, your coordinates must be"
        # puts "2 spaces long. Please give me coordinates"
        # puts "such as c4, d4. The space is important."
        # puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
        # puts "Let's try again: "
        user_numbers_second =  gets.chomp!.upcase
        user_numbers2_array = user_numbers_second.split(", ").to_a.sort!
      end

       while user_board.valid_placement?(user_sub, user_numbers2_array) == false
         @game_words.oops_bad_sub_overlap
         # puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
         # puts "Oops! Looks like you put in an invalid placement."
         # puts "Try again, except this time make sure the"
         # puts "coordinates are one after the other,"
         # puts "don't, overlap other ships, aren't diagonal,"
         # puts "and don't pass the edge"
         # puts "of the board... "
         # puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
         # puts "Let's try again: "
         user_sub = Ship.new("Submarine", 2)
         user_numbers_second =  gets.chomp!.upcase
         user_numbers2_array = user_numbers_second.split(", ").to_a.sort!
       end
       user_board.cells
       user_board.place(user_sub, user_numbers2_array)
       self.make_board_with_players(true)
       @game_words.lets_take_a_look
       # puts "How's it look?"
       # sleep(3)
       # puts ""
       # puts "Now we've gotta let George place his Sub,"
       # puts "decide who'll go first,"
       # print "and we'll be ready to play!"
       # "........".each_char do |char|
       #    print char
       #    $stdout.flush
       #    sleep 1
       #  end
       # sleep(2)
      @last_turn = user_name
      @game_words.slowing_things_down
      #  "........".each_char do |char|
      #     print char
      #     $stdout.flush
      #     sleep 1
      #   end
      #  sleep(2)
      # puts ""
      # p ""
      @last_turn = [user_name, "George"].sample
      puts ""
      puts "Looks like #{@last_turn} will be going first!"
      puts ""
      sleep(3)
      computer_options = user_board.cells.keys.shuffle

      until (user_sub.health == 0 && user_cruiser.health == 0) || (comp_sub.health == 0 && comp_cruiser.health == 0)
        if last_turn == "George" && turn_number != 0
          self.make_board_with_players(true, true)
          @game_words.first_fire_prompt
          # puts "Where would you like to fire?"
          # puts "Remember, plese give us a coordinate in this"
          # puts "in this format: 'A2' OR 'D3'"
          @user_fires = gets.chomp!.upcase
            until computer_board.valid_coordinate?([@user_fires]) == true
              @game_words.invalid_shot_location
              # puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
              # puts "Oops! Looks like you put in an invalid coordinate."
              # puts "Try again, except this time make sure the"
              # puts "coordinates are one after the other."
              # puts "Also, make sure you don't fire at"
              # puts "the same cell twice, and don't try"
              # puts "to fire at a cell off the board... "
              # puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
              # puts "Let's try again: "
              @user_fires = gets.chomp!.upcase
            end
          computer_board.cells[@user_fires].fire_upon
          if computer_board.cells[@user_fires].empty? == false
            @game_words.you_hit_a_ship
            # puts "You hit a ship!"
            # puts ""
            # sleep(2)
          else
            @game_words.you_missed_the_ship
            # puts "Ahh man, you missed."
            # puts ""
            # sleep(2)
          end
          @last_turn = user_name
          @turn_number += 1

        elsif last_turn == "George" && turn_number == 0
          @game_words.georges_turn
          # print "Georgy's turn"
          # "........".each_char do |char|
          #    print char
          #    $stdout.flush
          #    sleep 1
          #  end
          sleep(1)
          if user_board.cells[computer_options.first].empty? == false
            @game_words.george_hit_you
            # puts "George hit a ship!"
            # puts ""
            # sleep(1)
          else
            @game_words.george_missed_you
            # puts "Lucky... George missed"
            # puts ""
            # sleep(1)
          end
          user_board.cells[computer_options.shift].fire_upon
          @last_turn = "George"
          sleep(2)
          @turn_number += 1

        elsif last_turn == user_name && turn_number != 0
          puts ""
          puts "Georgy's turn"
          if user_board.cells[computer_options.first].empty? == false
            @game_words.george_hit_you
            # puts "George hit a ship!"
            # puts ""
            # sleep(1)
          else
            @game_words.george_missed_you
            # puts "Lucky... George missed"
            # puts ""
            # sleep(1)
          end
          user_board.cells[computer_options.shift].fire_upon
          @last_turn = "George"
          sleep(2)
          @turn_number += 1

        elsif last_turn == user_name && turn_number == 0
          self.make_board_with_players(true, true)
          @game_words.first_fire_prompt
          # puts "Where would you like to fire?"
          # puts "Remember, plese give us a coordinate in this"
          # puts "in this format: 'A2' OR 'D3'"
          @user_fires = gets.chomp!.upcase
            until computer_board.valid_coordinate?([@user_fires]) == true
              @game_words.invalid_shot_location
              # puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
              # puts "Oops! Looks like you put in an invalid coordinate."
              # puts "Try again, except this time make sure the"
              # puts "coordinates are one after the other."
              # puts "Also, make sure you don't fire at"
              # puts "the same cell twice, and don't try"
              # puts "to fire at a cell off the board... "
              # puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
              # puts "Let's try again: "
              @user_fires = gets.chomp!.upcase
              if computer_board.valid_coordinate?([@user_fires]) == true
                break
              end
            end
          computer_board.cells[@user_fires].fire_upon
          if computer_board.cells[@user_fires].empty? == false
            @game_words.you_hit_a_ship
            # puts "You hit a ship!"
            # sleep(2)
          else
            @game_words.you_missed_the_ship
            # puts "Dang, you missed."
            # sleep(2)
          end
          @last_turn = user_name
          @turn_number += 1
        end

        if (comp_sub.health == 0 && comp_cruiser.health == 0)
          @endgame.player_wins
          load './lib/game.rb'
        elsif (user_sub.health == 0 && user_cruiser.health == 0)
          @endgame.player_loses
          load './lib/game.rb'
        end
      end

      # *************    Gameplay ends here!!!    ****************
    elsif user_index == "q"
      p "Goodbye!"
    elsif user_index == "r"
      @rules.start_tutorial
      self.start
    else
      # puts ""
      # puts ""
      # puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
      # puts "|Invalid entry.   Please try again!|"
      # puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
      # puts ""
      # puts ""
      self.start
    end
  end
end

#
# game = Game.new
# game.start
