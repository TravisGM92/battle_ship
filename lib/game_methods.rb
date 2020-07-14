require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/tutorial'
require './lib/endgame'
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
                :user_fires

  def initialize
    @user_name = user_name
    @computer_board = Board.new
    @user_board = Board.new
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_sub = Ship.new("Submarine", 2)
    @rules = Tutorial.new("The Rules")
    @endgame = Endgame.new("The End")
    @game_words = GameWords.new("Words")
    @last_turn = last_turn
    @turn_number = 0
    @show = show
    @second = second
    @user_fires = user_fires
  end



  def user_placed_cruiser_poorly  #lines 65-69
    while user_numbers_array.length != 3
      @game_words.oops_bad_cruiser_coordinates
      user_numbers_first =  gets.chomp!.upcase
      user_numbers_array = user_numbers_first.split(", ").to_a.sort! #this line isn't gonna work I think
    end
  end

  def user_overlapped_the_cruiser #lines 71-75
    while user_board.valid_placement?(user_cruiser, user_numbers_array) == false
      @game_words.oops_bad_cruiser_overlap
      user_numbers_first =  gets.chomp!.upcase
      user_numbers_array = user_numbers_first.split(", ").to_a.sort! #this line isn't gonna work I think
    end
  end

  def user_placed_sub_poorly # lines 88-92
    while user_numbers2_array.length != 2
      @game_words.oops_bad_sub_coordinates
      user_numbers_second =  gets.chomp!.upcase
      user_numbers2_array = user_numbers_second.split(", ").to_a.sort! #this line isn't gonna work I think
    end
  end

  def user_overlapped_the_sub  #lines 94-99
    while user_board.valid_placement?(user_sub, user_numbers2_array) == false
      @game_words.oops_bad_sub_overlap
      user_sub = Ship.new("Submarine", 2)  #this line isn't gonna work I think
      user_numbers_second =  gets.chomp!.upcase
      user_numbers2_array = user_numbers_second.split(", ").to_a.sort!  # this one either
    end
  end

  def hitting_the_ship #lines 124-128, and 170-174
    if computer_board.cells[@user_fires].empty? == false
      @game_words.you_hit_a_ship
    else
      @game_words.you_missed_the_ship
    end
  end

  def george_hitting_you  #lines 135-139, and lines 148-152
    if user_board.cells[computer_options.first].empty? == false
      @game_words.george_hit_you
    else
      @game_words.george_missed_you
    end
  end

  def invalid_user_shot_location #lines 162-168
    until computer_board.valid_coordinate?([@user_fires]) == true
      @game_words.invalid_shot_location
      @user_fires = gets.chomp!.upcase #these next few lines actually show up similarly on line 119-122, but without the if statement below
      if computer_board.valid_coordinate?([@user_fires]) == true
        break
      end
    end

  end

  def this_is_the_end  #lines 179-185
    if (comp_sub.health == 0 && comp_cruiser.health == 0)
      @endgame.player_wins
      load './runner.rb'
    elsif (user_sub.health == 0 && user_cruiser.health == 0)
      @endgame.player_loses
      load './runner.rb'
    end
  end
end
