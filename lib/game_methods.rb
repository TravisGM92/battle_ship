require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/tutorial'
require './lib/game_words'
require './lib/turn'
require './lib/game'


class GameMethods

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
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_sub = Ship.new("Submarine", 2)
    @last_turn = last_turn
    @turn_number = 0
    @show = show
    @second = second
    @user_fires = user_fires
  end

  def user_input
    gets.chomp!
  end

  def invalid_board_size
    until user_board.user_width1 >= 4 && user_board.user_width1 < 50
      @game_words.invalid_user_board_size
      user_board.user_width1 = user_input.to_i
    end
  end

  def user_placed_cruiser_poorly
    while user_numbers_array.length != 3
      @game_words.oops_bad_cruiser_coordinates
      user_numbers_first =  user_input.upcase
      user_numbers_array = user_numbers_first.split(", ").to_a.sort! #this line isn't gonna work I think
    end
  end

  def user_overlapped_the_cruiser
    while user_board.valid_placement?(user_cruiser, user_numbers_array) == false
      @game_words.oops_bad_cruiser_overlap
      user_numbers_first =  user_input.upcase
      user_numbers_array = user_numbers_first.split(", ").to_a.sort!
    end
  end

  def user_placed_sub_poorly
    while user_numbers2_array.length != 2
      @game_words.oops_bad_sub_coordinates
      user_numbers_second =  user_input.upcase
      user_numbers2_array = user_numbers_second.split(", ").to_a.sort!
    end
  end

  def user_overlapped_the_sub
    while user_board.valid_placement?(user_sub, user_numbers2_array) == false
      @game_words.oops_bad_sub_overlap
      user_sub = Ship.new("Submarine", 2)
      user_numbers_second =  user_input.upcase
      user_numbers2_array = user_numbers_second.split(", ").to_a.sort!
    end
  end

  def hitting_the_ship
    if computer_board.cells[@user_fires].empty? == false
      @game_words.you_hit_a_ship
    else
      @game_words.you_missed_the_ship
    end
  end

  def george_hitting_you  #lines 156-160, and lines 169-173
    if user_board.cells[computer_options.first].empty? == false
      puts ""
      @game_words.george_hit_you
    else
      @game_words.george_missed_you
    end
  end

  def invalid_user_shot_location
    until computer_board.valid_coordinate?([@user_fires]) == true
      @game_words.invalid_shot_location
      @user_fires = user_input.upcase
      if computer_board.valid_coordinate?([@user_fires]) == true
        break
      end
    end

  end

  def this_is_the_end
    if (comp_sub.health == 0 && comp_cruiser.health == 0)
      @game_words.player_wins
      load './runner.rb'
    elsif (user_sub.health == 0 && user_cruiser.health == 0)
      @game_words.player_loses
      load './runner.rb'
    end
  end
end
