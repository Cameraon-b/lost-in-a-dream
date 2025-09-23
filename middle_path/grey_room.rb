#2nd room in the middle path
#grey room method
def grey_room
  $ascii_grey_room = [
"  ____  ____     ___  __ __      ____   ___    ___   ___ ___  ",
" /    ||    \\   /  _]|  |  |    |    \\ /   \\  /   \\ |   |   | ",
"|   __||  D  ) /  [_ |  |  |    |  D  )     ||     || _   _ | ",
"|  |  ||    / |    _]|  ~  |    |    /|  O  ||  O  ||  \\_/  | ",
"|  |_ ||    \\ |   [_ |___, |    |    \\|     ||     ||   |   | ",
"|     ||  .  \\|     ||     |    |  .  \\     ||     ||   |   | ",
"|___,_||__|\\_||_____||____/     |__|\\_|\___/  \\___/ |___|___| "
  ]
  $ascii_grey_room.each_with_index do |line, index|
    puts "\e[38;5;245m#{line}\e[0m"
  end

  $visited_rooms["grey_room"] += 1
  visits = $visited_rooms["grey_room"]

  # loop through the visits to the grey room
  # and print different messages based on the number of visits
  case visits
  when 1
    slow_print("\n\e[38;5;245mYou find yourself in a room of grey.\n\e[0m")
    gets
    slow_print("\n\e[38;5;245mA sense of neutrality washes over you...\n\e[0m")
    gets
    slow_print("\n\e[38;5;245mThe walls and floor are made of small grey tiles.\n\e[0m")
    gets
    slow_print("\n\e[38;5;245mThe ceiling is flat and grey, really nothing special.\n\e[0m")
    gets
    slow_print("\n\e[38;5;245mThere is a \e[38;5;52mlarge wooden chest\e[38;5;245m in the middle of the room\n\e[0m")
    gets
    slow_print("\n\e[38;5;245mIt is a \e[38;5;52mdark wood\e[38;5;245m, with \e[1;38;5;251mmetal accents\e[38;5;245m.\n\e[0m")
    gets
    slow_print("\n\e[38;5;245mIt has intricate carvings on the surface.\n\e[0m")
    gets
    slow_print("\n\e[38;5;245mCarvings of mythical creatures and strange symbols.\n\e[0m")
    gets
    slow_print("\n\e[38;5;245mThe grey room bores you, but the chest demands your attention.\n\e[0m")
    gets
    slow_print("\n\e[38;5;245mYou notice a door on the opposite side of the room.\n\e[0m")
    gets
    slow_print("\n\e[38;5;245mIt is also made of \e[38;5;180mwood\e[38;5;245m, but it's much lighter in color.\n\e[0m")
    gets
    slow_print("\n\e[38;5;245mIt has some carvings on it, but they are not as intricate as the \e[38;5;52mchest\e[38;5;245m.\n\e[0m")
    gets

  when 2
    slow_print("\n\e[38;5;245mYou are in the grey room.\n\e[0m")
    gets

  else
    slow_print("\n\e[38;5;245mYou are in the grey room.\n\e[0m")
    gets
  end

  loop do
    slow_print("\n\e[38;5;245mYou must make a choice: \n1. explore \n2. back \n3. eat \n4. sleep \n5. stay \n6. open \n7. menu\n\e[0m")
    print "> "
    choice = gets.chomp.downcase

      case choice
      when "open", "6"
        if !$chest1_opened
          slow_print("\n\e[38;5;245mYou decide to open the \e[38;5;180mwooden chest\e[38;5;245m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;245mThe lid is cold and heavy.\n\e[0m")
          gets
          slow_print("\n\e[38;5;245mInside is a bunch of clothes, and shoes.\n\e[0m")
          gets
          slow_print("\n\e[38;5;245mYou take a moment to rummage through the items.\n\e[0m")
          gets
          slow_print("\n\e[38;5;245mAs you lift a shoe a \e[38;5;250msilver key\e[38;5;245m falls out, onto the floor\n\e[0m")
          gets
          slow_print("\n\e[38;5;245mYou pick it up, and put it in your bag.\n\e[0m")
          gets
          slow_print("\n\e[38;5;245m*\e[38;5;250msilver key\e[38;5;245m has been added to your bag.*\n\e[0m")
          gets
          $inventory << "silver key"
          $chest1_opened = true
          save_game("autosave")
        else
          slow_print("\n\e[38;5;245mThere is nothing of value left in the chest.\n\e[0m")
          gets
        end

      when "explore", "1"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "brown_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "brown_room"

      when "back", "2"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "red_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "red_room"

      when "eat", "3"
        return eat("grey_room")

      when "sleep", "4"
        return sleep_action("grey_room")

      when "menu", "7"
        menu_handler
        return if $just_loaded_game # If just loaded, return to avoid changing room

      when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room

      when "stay", "5"
        $stay_counts["grey_room"] += 1
        times_stayed = $stay_counts["grey_room"]

        case times_stayed

        when 1
          if !$chest1_opened
            slow_print("\n\e[38;5;245mYou stare at the chest for a moment...\n\e[0m")
            gets
            slow_print("\n\e[38;5;245mYou wonder what could be inside...\n\e[0m")
            gets
            slow_print("\n\e[38;5;245mYou wonder what might happen if you open it...\n\e[0m")
            gets
            slow_print("\n\e[38;5;245mCould it be a trap?\n\e[0m")
            gets
            slow_print("\n\e[38;5;245m...\n\e[0m")
            gets

          else
            slow_print("\n\e[38;5;245mYou take a deep breath...\n\e[0m"); 
            gets
            slow_print("\n\e[38;5;245mA plain, steady comfort settles over the grey room.\n\e[0m");
            gets
            slow_print("\n\e[38;5;245mThe grey tiles are quiet and unassuming.\n\e[0m");
            gets
            slow_print("\n\e[38;5;245mYou could sit with this quiet for a very long time.\n\e[0m");
            gets
            slow_print("\n\e[38;5;245m...\n\e[0m");
            gets
          end

        when 2
          slow_print("\n\e[38;5;245mYou notice the grout lines form a grid that almost, but not quite, aligns when you cross your eyes.\n\e[0m"); 
          gets
          slow_print("\n\e[38;5;245mSomewhere in the walls, a soft hum rises and falls with your breathing.\n\e[0m"); 
          gets
          slow_print("\n\e[38;5;245mYou press your palm to the tile and feel a faint vibration.\n\e[0m"); 
          gets
          slow_print("\n\e[38;5;245mThe room has your attention now. It is reserved, waiting.\n\e[0m"); 
          gets

        when 3
          slow_print("\n\e[38;5;245mYou sit very still and begin to feel the vibration in your body.\n\e[0m"); 
          gets
          slow_print("\n\e[38;5;245mIt is similar to being in a car on the highway.\n\e[0m"); 
          gets
          slow_print("\n\e[38;5;245mThe grey room seems to be moving.\n\e[0m"); 
          gets
          slow_print("\n\e[38;5;245mBut where can it go?\n\e[0m"); 
          gets
          slow_print("\n\e[38;5;245m...\n\e[0m"); 
          gets
          slow_print("\n\e[38;5;245m......\n\e[0m"); 
          gets
          slow_print("\n\e[38;5;245m............\n\e[0m"); 
          gets

        else
          slow_print("\n\e[38;5;245mThe vibration becomes more intense, you have a growing discomfort.\n\e[0m")
          gets
          slow_print("\n\e[38;5;245mYour feet begin to hurt and a sense of panic develops.\n\e[0m")
          gets
          slow_print("\n\e[38;5;245mA high pitched hum now accompanies the vibration...\n\e[0m")
          gets
          slow_print("\n\e[38;5;245mYou decide it's time to leave the grey room.\n\e[0m")
          gets
          short_load_animation
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "brown_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          return "brown_room"
        end # end case times_stayed

      else
        slow_print("\n\e[38;5;245mThat is not a choice in this moment...\n\e[0m")
      end # end case choice
    end # end loop
  end # end def grey_room