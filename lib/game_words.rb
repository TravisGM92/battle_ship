
class GameWords

  def initialize(game_words)
    @game_words = game_words
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




end
