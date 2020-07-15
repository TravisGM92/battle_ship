
class GameWords

  def initialize(game_words)
    @game_words = game_words
  end

  def making_board_for_you
    puts "--------------------"
    puts "Here's the board..."
    sleep(1.5)
    puts ""
    p "*** George ***"
  end

  def game_opening
    puts "*****************  Welcome to BATTLESHIP  *****************"
    puts ""
    puts "                   Enter p to Play."
    puts "                   Enter r to Read The Rules."
    p "                  Enter q to Quit."
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
    p "What do your homies call you?"
  end

  def user_board_size_prompt
    puts ""
    puts "And how wide would you like your board to be?"
    p "Pick a number between 4 and 50: "
  end

  def invalid_user_board_size
    puts "Oops! Please pick a number"
    p "between 4 and 50: "
  end

  def computer_board_size_prompt
    puts "And what about George's board?"
    puts "We recommend putting the same number"
    p "otherwise you're getting off easy..."
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
    puts "1) The Cruiser, known for its"
    puts "impeccable speed, with 3 spaces"
    puts "              and   "
    puts "2) the Submarine, known for its"
    puts "subness, with 2 spaces"
    sleep(9.5)
    puts "------------------------------------"
    print "Now, where would you like your cruiser to go? Remember" #or should that be print?
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
    p "So, where's it gonna go?"
  end

  def oops_bad_cruiser_coordinates
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts "Coordinates Oops! Remember, your coordaintes must be"
    puts "3 spaces long. Please give me coordinates"
    puts "such as a1, a2, a3."
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    p "Let's try again:"
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
    p "Let's try again: "
  end

  def cruiser_has_been_placed
    puts "==================================="
    p "Ok, here is where your Cruiser has been placed"
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
    p "It's not gonna be that easy."
  end

  def add_submarine_prompt
    sleep(6)
    puts "Now let's add your Submarine!"
    puts "where would you like that to go?"
    puts "Remember, it only has 2 spaces"
    p "So, where's it gonna go? "
  end

  def oops_bad_sub_coordinates
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts "Oops! Remember, your coordinates must be"
    puts "2 spaces long. Please give me coordinates"
    puts "such as c4, d4. The space is important."
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    p "Let's try again: "
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
    p "Let's try again: "
  end

  def lets_take_a_look
    puts "How's it look?"
    sleep(3)
    puts ""
    puts "Now we've gotta let George place his Sub,"
    puts "decide who'll go first,"
    print "and we'll be ready to play!"
    "....".each_char do |char|
       print char
       $stdout.flush
       sleep 0.8
     end
  end

  def slowing_things_down
    "....".each_char do |char|
       print char
       $stdout.flush
       sleep 0.8
     end
    sleep(1)
   puts ""
   p ""
  end


  def fire_prompt
    puts "Where would you like to fire?"
    puts "Remember, plese give us a coordinate in this"
    p "in this format: 'A2' OR 'D3'"
  end

  def already_shot_that_cell
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts "Oops! Looks like you have already"
    puts "shot there. Try again, except this"
    puts "time fire at a new coordinate."
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    p "Let's try again: "
  end

  def invalid_shot_location
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts "Oops! Looks like you put in an invalid"
    puts "coordinate. Try again, except this time"
    puts "make sure the coordinates are on the board."
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    p "Let's try again: "
  end

  def you_hit_a_ship
    puts "You hit a ship!"
    p ""
    sleep(2)
  end

  def you_missed_the_ship
    puts "Ahh man, you missed."
    p ""
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
    p ""
    sleep(1)
  end

  def george_missed_you
    puts "Lucky... George missed"
    p ""
    sleep(1)
  end

  def invalid_entry
    puts ""
    puts ""
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts "|Invalid entry.   Please try again!|"
    puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts ""
    p ""
  end

  def player_wins
    puts "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts "YOU. SUNK. OUR. BATTLESHIPS!"
    puts "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts "Congratulation #{@user_name}"
    puts "You've bested our best commander,"
    puts "And for that, we're awarding you our"
    puts "biggest trophy! Are you readyyy?"
    sleep(8)
    puts "        ...................................................................................................."
    puts "    ...................................................................................................."
    puts "    ....... ..DMDN=$.................................................................. D+N~N.. .  ......"
    puts "    ...... .??=I7.+$N=. .. ..........................................................,.M$IN=$?M........."
    puts "    .......$+=~M:$~N+8...............................................................:=N,~IMNNMO ......."
    puts "    .......+.7NI..Z:MM... ......................~,,,.................................ZMO7..D87O7........"
    puts "    ..... ..,N,. .~I,+......=IDDONMMOZI:DNMNNDDO$$77I+?IIII$ODNDDNN,IZ$88OZO7..... ..~7I:...8++, ......."
    puts "    ..... .=Z8I~....D$.....?+IO?=MMM8?:,DMNNDD8Z$$77777?II77$OODNMM,:7ZNNN=ZD88D....87O....,ONO, ......."
    puts "    ...... .NI+I.....,O,  .I?+Z8MMDO88OO8.......~$7Z77ZOZO...,,...IDD88OZ?I87I+,...=NN.....$:8D........."
    puts "    ...... .:N,=~....I,D...+??Z8MMMM8MMDD.......NMMMMMMMMMM7......DMMMMMII77$?+?...Z8$.....=:$$........."
    puts "    ...... ..~,O:.. ..Z=NO$~?+$O8888D888O....,+ZNMMMMMMMMMMND88?.,?$ZOOOZII+OZ+?IO+??. ...N.:Z.. ......."
    puts "    ..........$:,O..  . .  =++7$ZZZZND7?~,,.,,,,:~~=======~~:,,,,:~+?I7$+I:8O7++.=..... .O~,I. ........."
    puts "    .... .... .~+OI.. ... ..+~?I777I??+==~:::::~~=$=I?+I+==~~::::~=++??NIIIZI++. .......,=.+............"
    puts "    .............D+D .......=7???+ZO?+++==~~~~~=~~ZIIN$I???=~~~~==++++??77ZZ+I=.........DN~. ..........."
    puts "    ..... .. .....$I?.....  .+7$ZZ$?O+++=======~~ZZIZO7O?7?======++++??7II?+++...... ..DD..............."
    puts "    ...... ........I7+........+?7N=87?+++=====++8D?IO8ZI7$=+=====++++I$$I+++7=.......DN=................"
    puts "    ......... .. ...II+.......=?D?:~D?I++======+?Z8I7877OI~+====++++?I?I?+=++.......8N+................."
    puts "    ........ .. ......~I?..  ..=$MNNZ77?++++===8+?$DZZ7?7==:==++++?8ZOI?++?=......:IN... ... ..........."
    puts "    ....... ...........++D..... ,?+$$DZ?I???+===.:??7Z???.~=++++?IN77I?++?=.....,OZ~...................."
    puts "    ...... .. ...........~,=... ..7++?II7?NI?+++====$87~=++++++?INNN?+++I. ....I,:......................"
    puts "    ......................==II...$$Z++??IONZ7??++++++++++++++???III?+++7$8...O?=7......................."
    puts "    ....... ................,Z+::ZI..?=+?II77I??IM8$7II7Z??????????++Z..D7=7=+=... ....................."
    puts "    ...........................=+?,....:7+?IIIIIIZ8+7Z?8OZI???????I?.....I=~. .... ....................."
    puts "    ......... ....................II,.....=++?I??II7+OZ7II????++=......O=:............. ................"
    puts "    ................... ............7+ ...... ,+O8ZI$7=8I$+=:. ......7=. ..............................."
    puts "    ...............................I=$..........,78$O78OI............Z8I ..............................."
    puts "    .................................=?= ......~I$D+OIOO7I ....... ,+I..... ............... ............"
    puts "    ... ....................... ........... ..:ODDZ7NN+DNI+................ ............................"
    puts "    ..........................................+7,8 ~MN..N$+............................................."
    puts "    ..........................................?ODZ?7ZO$ZOO7= ..........................................."
    puts "    ...........................................?7?7II?$???+. ...... ... ................................"
    puts "    ............................................=I?O??+?~=........................... .................."
    puts "    .............................................+~====7+..............................................."
    puts "    .............................................++===?=........... ...................................."
    puts "    .............................................+~~~~~I.... ............ .............................."
    puts "    .............................................I7+==??................................................"
    puts "    .............................................Z~.NI,$........... .......................... ........."
    puts "    ............................................=~=+NN$,+..... .. ... . ...... ............... ...... .."
    puts "    ............................................I~DODD=?I~... ....... ....... ....  ....  .. ..........."
    puts "    ...........................................IZ.N..,.~OI=............................................."
    puts "    .........................................+?ZNOZ??I?I?D+=........... ................................"
    puts "    .........................................=Z$8I=$$$II8Z$= ..........................................."
    puts "    .........................................+NNN..DMM..NMD=....... .. ... .. ........ .... ............"
    puts "    ........................................=?ZDN..DMN..8O7+=. ........................................."
    puts "    .......................................+IIO8NN......DD$O?= ........................................."
    puts "    .......................................?8$INDNNMMMNNDD$78+~...... .................................."
    puts "    ......................................=I8NZD. .NMM...ON+8?=........................................."
    puts "    ......................................+I$OM$ .$NMMD..7MO?++. ......................................."
    puts "    .....................................=?NZ?ZN8OODNDZ~DDN8$8+=........................................"
    puts "    .....................................+7777N...NNMMD...NN7ZI=. ......................................"
    puts "    ...................................I++?O$DI?..8MMMN...=IND+==......................................."
    puts "    ...................................I$$?~$Z8...OMMMN...??+,O+Z..... .. ...  . . ..... .....  ........"
    puts "    ...................................DDDDDDND888DNDDD888D88OOO8$......................................"
    puts "    ...................................NMMMNNNNNNNNMNMNNN8MNNMMMND ....................................."
    puts "    ...................................NMN7==================+ONM8 ....................................."
    puts "    ...................................NMD====?+?==+?=?~?=?====MND ....................................."
    puts "    ...................................NMD~~==~~==~============MNO ....................................."
    puts "    ...................................NMO~~~~~=~~=??=~====~=~=DN8......................................"
    puts "    ...................................MM$~~~~~I=~~~~+~==+~~~==NDO ... ................................."
    puts "    ...................................MM8=~~~~~~====~~=~=~~~~~NNO ........................... ........."
    puts "    ...................................MMMM~::::::::::::~:::::8MNO ....................................."
    puts "    ...................................NNMMMMMMMMMMMMMMMMMMMMNMMNZ ....................................."
    puts "    ..................................... ...  .. ........................... ............. ............"
    puts "    ...................................................................................................."
    puts "    ................................................ .. ..... ................. ........... ............"
    puts "    .... ...................................................... ..................... .................."
    sleep(10)
    puts "COME BACK!  ZOOM BACK IN!"
    sleep(5)
    puts " We think you're great, and would"
    p "love to play again. Would you?"
  end

  def player_loses
    puts "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts "AWwww dang it. You lost :("
    puts "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    puts "Well I have to say you actually did get"
    puts "pretty close. If George hadn't lucked"
    puts "out on that last one, you would have"
    puts "had him for sure. What do you say?"
    puts "One more game?"
    sleep(5)
  end
end
