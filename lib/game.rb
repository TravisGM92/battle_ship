require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/tutorial'
require './lib/game_words'
require './lib/game_words'
# require './lib/smart_computer'


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
                :user_fires,
                :user_width

  def initialize
    @user_name = user_name
    @rules = Tutorial.new("The Rules")
    @game_words = GameWords.new("Words")
    @last_turn = last_turn
    @turn_number = 0
    @show = show
    @second = second
    @user_fires = user_fires
  end

  def make_board_with_players(show=false, second=false)
    @game_words.making_board_for_you
    computer_board.render(show=false, second)
    puts "-------------"
    puts "*** #{@user_name} ***"
    user_board.render(show=true, second=true)
  end

  def user_input
    gets.chomp!
  end

  def start()
    @game_words.game_opening
    user_index = user_input.downcase
    if user_index == "p"
      @game_words.comp_intro
      @user_name = user_input
      @game_words.user_board_size_prompt
      @user_board = Board.new
      until user_board.user_width1 >= 4 && user_board.user_width1 < 50
        @game_words.invalid_user_board_size
        user_board.user_width1 = user_input.to_i
      end
      @game_words.computer_board_size_prompt
      @computer_board = Board.new
      @comp_cruiser = Ship.new("Cruiser", 3)
      @comp_sub = Ship.new("Submarine", 2)
      sub_cord = computer_board.valid_placement_for_sub(comp_sub)
      computer_board.place(comp_sub, sub_cord)
      cruise_cord = computer_board.valid_placement_for_cruiser(comp_cruiser)
      computer_board.place(comp_cruiser, cruise_cord)
      self.make_board_with_players
      @game_words.ship_intro
      user_board.cells
      @game_words.cruiser_placement_prompt
      user_cruiser = Ship.new("Cruiser", 3)
      user_numbers_first =  user_input.upcase
      user_numbers_array = user_numbers_first.split(", ").to_a

      while user_numbers_array.length != 3
        @game_words.oops_bad_cruiser_coordinates
        user_numbers_first =  user_input.upcase
        user_numbers_array = user_numbers_first.split(", ").to_a
      end

      while user_board.valid_placement?(user_cruiser, user_numbers_array) == false
        @game_words.oops_bad_cruiser_overlap
        user_numbers_first =  user_input.upcase
        user_numbers_array = user_numbers_first.split(", ").to_a
      end

      @game_words.cruiser_has_been_placed
      user_board.cells
      computer_board.cells
      user_board.place(user_cruiser, user_numbers_array)
      puts "----------------------------"
      user_board.render(true, true)
      @game_words.george_placing_cruiser
      self.make_board_with_players(true)
      @game_words.add_submarine_prompt
      user_sub = Ship.new("Submarine", 2)
      user_numbers_second =  user_input.upcase
      user_numbers2_array = user_numbers_second.split(", ").to_a.sort!

      while user_numbers2_array.length != 2
        @game_words.oops_bad_sub_coordinates
        user_numbers_second =  user_input.upcase
        user_numbers2_array = user_numbers_second.split(", ").to_a.sort!
      end

       while user_board.valid_placement?(user_sub, user_numbers2_array) == false
         @game_words.oops_bad_sub_overlap
         user_sub = Ship.new("Submarine", 2)
         user_numbers_second =  user_input.upcase
         user_numbers2_array = user_numbers_second.split(", ").to_a.sort!
       end

       user_board.cells
       user_board.place(user_sub, user_numbers2_array)
       self.make_board_with_players(true)
       @game_words.lets_take_a_look
      @last_turn = user_name
      @game_words.slowing_things_down
      @last_turn = [user_name, "George"].sample
      puts ""
      puts "Looks like #{@last_turn} will be going first!"
      puts ""
      sleep(3)
      computer_options = user_board.cells.keys.shuffle
      until (user_sub.health == 0 && user_cruiser.health == 0) || (comp_sub.health == 0 && comp_cruiser.health == 0)
        if last_turn == "George" && turn_number != 0
          self.make_board_with_players(true, true)
          @game_words.fire_prompt
          @user_fires = user_input.upcase
            until computer_board.valid_coordinate?([@user_fires]) == true
              if computer_board.cells.values.select{ |x|
                x.fired_upon?}.any?{ |x|
                  x.coordinate.include?(user_fires)} == true
                @game_words.already_shot_that_cell
                @user_fires = user_input.upcase
              else
                @game_words.invalid_shot_location
                @user_fires = user_input.upcase
              end
            end
          computer_board.cells[@user_fires].fire_upon
          if computer_board.cells[@user_fires].empty? == false
            @game_words.you_hit_a_ship
          else
            @game_words.you_missed_the_ship
          end
          @last_turn = user_name
          @turn_number += 1

        elsif last_turn == "George" && turn_number == 0
          if user_board.cells[computer_options.first].empty? == false
            puts ""
            @game_words.george_hit_you
          else
            @game_words.george_missed_you
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
          else
            @game_words.george_missed_you
          end
          user_board.cells[computer_options.shift].fire_upon
          @last_turn = "George"
          sleep(2)
          @turn_number += 1

        elsif last_turn == user_name && turn_number == 0
          self.make_board_with_players(true, true)
          @game_words.fire_prompt
          @user_fires = user_input.upcase
            until computer_board.valid_coordinate?([@user_fires]) == true
              if computer_board.cells.values.select{ |x|
                x.fired_upon?}.any?{ |x|
                  x.coordinate.include?(user_fires)} == true
                @game_words.already_shot_that_cell
                @user_fires = user_input.upcase
              else
                @game_words.invalid_shot_location
                @user_fires = user_input.upcase
              end
              if computer_board.valid_coordinate?([@user_fires]) == true
                break
              end
            end
          computer_board.cells[@user_fires].fire_upon
          if computer_board.cells[@user_fires].empty? == false
            @game_words.you_hit_a_ship
          else
            @game_words.you_missed_the_ship
          end
          @last_turn = user_name
          @turn_number += 1
        end

        if (comp_sub.health == 0 && comp_cruiser.health == 0)
          @game_words.player_wins
          load './runner.rb'
        elsif (user_sub.health == 0 && user_cruiser.health == 0)
          @game_words.player_loses
          load './runner.rb'
        end
      end
      # *************    Gameplay ends here!!!    ****************
    elsif user_index == "q"
      p "Goodbye!"
    elsif user_index == "r"
      @rules.start_tutorial
      self.start
    else
      @game_words.invalid_entry
      self.start
    end
  end
end
