
class GameWords

  def initialize(game_words)
    @game_words = game_words
  end

  def making_board_for_you
    puts "--------------------"
    puts "Here's the board..."
    sleep(1.5)
    puts ""
    puts "*** George ***"
  end

  def game_opening
    puts "*****************  Welcome to BATTLESHIP  *****************"
    puts ""
    puts "                   Enter p to Play."
    puts "                   Enter r to Read The Rules."
    puts "                   Enter q to Quit."
  end

  def comp_intro
    print "                   You have choosen wisely"
    ".....".each_char do |char|
       print char
       $stdout.flush
       sleep 0.8
      end
    puts ""
    puts ""
    puts "------------------------------------"
    puts "You will go head-to-head in a vicious"
    puts "game of battleship against the world's"
    puts "most formidable opponent... "
    sleep(6.5)
    puts ""
    puts ""
    puts "-------->        GEORGE!!!        <--------"
    sleep(4)
    puts ""
    puts "====================================="
    puts "Let's start with your name."
    puts "What do your homies call you?"
  end

  def ship_intro
    sleep(6)
    puts ""
    print "Let's place your ships. You've got 2 ships"
    "......".each_char do |char|
       print char
       $stdout.flush
       sleep 0.75
     end
    puts ""
    puts ""
    puts "1) The Cruiser, known for it's"
    puts "impeccable speed, with 3 spaces"
    puts "              and   "
    puts "2) the Submarine, known for it's"
    puts "subness, with 2 spaces"
    sleep(9.5)
    puts "------------------------------------"
    puts "Now, where would you like your cruiser to go? Remember" #or should that be print?
    "......".each_char do |char|
      print char
      $stdout.flush
      sleep 1
    end
  end

  def cruiser_placement_prompt
    puts ""
    puts ""
    puts "1) The ship can't be diagonal"
    puts "2) The ship can't overlap any other ship"
    puts "3) You've gotta make sure it spans the"
    puts "   length of the ship, no more, no less."
    puts "Example: a1, a2, a3"
    puts "------------------------------------"
    puts "So, where's it gonna go? "
  end

  def oops_bad_cruiser_coordinates
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts "Oops! Remember, your coordaintes must be"
    puts "3 spaces long. Please give me coordinates"
    puts "such as a1, a2, a3."
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts "Let's try again: "
  end

  def oops_bad_cruiser_overlap
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts "Oops! Looks like you put in an invalid placement."
    puts "Try again, except this time make sure the"
    puts "coordinates are one after the other,"
    puts "don't overlap other ships, aren't diagonal,"
    puts "and don't pass the edge"
    puts "of the board... "
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts "Let's try again: "
  end

  def cruiser_has_been_placed
    puts "==================================="
    puts "Ok, here is where your Cruiser has been placed"
  end


  def george_placing_cruiser
    sleep(5)
    puts "Now we've gotta let George place his Cruiser."
    print "George is careful. It may take him a minute"
    "........".each_char do |char|
       print char
       $stdout.flush
       sleep 1
     end
    puts ""
    puts "==================================="
    sleep(2)
    puts "Here's the board with your cruiser on there"
    puts "Obviously we won't show you George's ship..."
    puts "It's not gonna be that easy."
  end

  def add_submarine_prompt
    sleep(6)
    puts "Now let's add your Submarine!"
    puts "where would you like that to go?"
    puts "Remember, it only has 2 spaces"
    puts "So, where's it gonna go? "
  end

  def oops_bad_sub_coordinates
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts "Oops! Remember, your coordinates must be"
    puts "2 spaces long. Please give me coordinates"
    puts "such as c4, d4. The space is important."
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts "Let's try again: "
  end

  def oops_bad_sub_overlap
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts "Oops! Looks like you put in an invalid placement."
    puts "Try again, except this time make sure the"
    puts "coordinates are one after the other,"
    puts "don't, overlap other ships, aren't diagonal,"
    puts "and don't pass the edge"
    puts "of the board... "
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts "Let's try again: "
  end

  def lets_take_a_look
    puts "How's it look?"
    sleep(3)
    puts ""
    puts "Now we've gotta let George place his Sub,"
    puts "decide who'll go first,"
    print "and we'll be ready to play!"
    "........".each_char do |char|
       print char
       $stdout.flush
       sleep 1
     end
  end

  def slowing_things_down
    "........".each_char do |char|
       print char
       $stdout.flush
       sleep 1
     end
    sleep(2)
   puts ""
   p ""
  end


  def first_fire_prompt
    puts "Where would you like to fire?"
    puts "Remember, plese give us a coordinate in this"
    puts "in this format: 'A2' OR 'D3'"

  end


  def invalid_shot_location
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts "Oops! Looks like you put in an invalid coordinate."
    puts "Try again, except this time make sure the"
    puts "coordinates are one after the other."
    puts "Also, make sure you don't fire at"
    puts "the same cell twice, and don't try"
    puts "to fire at a cell off the board... "
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts "Let's try again: "
  end

  def you_hit_a_ship
    puts "You hit a ship!"
    puts ""
    sleep(2)
  end

  def you_missed_the_ship
    puts "Ahh man, you missed."
    puts ""
    sleep(2)
  end

  def georges_turn
    print "Georgy's turn"
    "........".each_char do |char|
       print char
       $stdout.flush
       sleep 1
     end
    sleep(1)
  end

  def george_hit_you
    puts "George hit a ship!"
    puts ""
    sleep(1)
  end

  def george_missed_you
    puts "Lucky... George missed"
    puts ""
    sleep(1)
  end

  def invalid_entry
    puts ""
    puts ""
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts "|Invalid entry.   Please try again!|"
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts ""
    puts ""
  end

end
