#2nd room in the left path
#white room method
def white_room
  $ascii_white_room = [
" __    __  __ __  ____  ______    ___      ____   ___    ___   ___ ___  ",
"|  |__|  ||  |  ||    ||      |  /  _]    |    \\ /   \\  /   \\ |   |   | ",
"|  |  |  ||  |  | |  | |      | /  [_     |  D  )     ||     || _   _ | ",
"|  |  |  ||  _  | |  | |_|  |_||    _]    |    /|  O  ||  O  ||  \\_/  | ",
"|  `  '  ||  |  | |  |   |  |  |   [_     |    \\|     ||     ||   |   | ",
" \\      / |  |  | |  |   |  |  |     |    |  .  \\     ||     ||   |   | ",
"  \\_/\\_/  |__|__||____|  |__|  |_____|    |__|\\_|\\___/  \\___/ |___|___| ",
"                                                                        "
  ]
  $ascii_white_room.each_with_index do |line, index|
    puts "\e[1;97m#{line}\e[0m"
  end

  $visited_rooms["white_room"] += 1
  visits = $visited_rooms["white_room"]

  # The player can explore, eat, sleep, or stay in the room.
  case visits
  when 1
    slow_print("\n\e[97mYou find yourself in a room of white.\n\e[0m")
    gets
    slow_print("\n\e[97mThe walls and floor are made of a smooth white stone.\n\e[0m")
    gets
    slow_print("\n\e[97mWonderfully smooth, no cracks or imperfections.\n\e[0m")
    gets
    slow_print("\n\e[97mYou feel a sense of emptiness at first.\n\e[0m")
    gets
    slow_print("\n\e[97mThen the white envelopes you.\n\e[0m")
    gets
    slow_print("\n\e[97mYou feel at peace, your mind is quiet.\n\e[0m")
    gets
    slow_print("\n\e[97mYou notice a door on the opposite side of the room.\n\e[0m")
    gets
    slow_print("\n\e[97mIt is an imposing \e[38;5;235mblack metal door\e[97m.\n\e[0m")
    gets

  when 2
    slow_print("\n\e[97mYou find yourself in the white room.\n\e[0m")
    gets

  else
    slow_print("\n\e[97mYou are in the white room.\n\e[0m")
    gets
  end

# Loop for player choices in the white room
  loop do
    slow_print("\n\e[97mYou must make a choice: \n1. explore \n2. back \n3. eat \n4. sleep \n5. stay \n6. menu\n\e[0m")
    print "> "
    choice = gets.chomp.downcase

      case choice

      when "explore", "1"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "black_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "black_room"

      when "back", "2"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "blue_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "blue_room"

      when "eat", "3"
        return eat("white_room")

      when "sleep", "4"
        return sleep_action("white_room")

      when "menu", "6"
        menu_handler
        return if $just_loaded_game # If just loaded, return to avoid changing room

      when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room

      when "stay", "5" # Stays in the white room
        #tracks how many times the player has stayed in the white room
        $stay_counts["white_room"] += 1
        times_stayed = $stay_counts["white_room"]

        case times_stayed
        when 1
          slow_print("\n\e[97mYou take a deep breath...\n\e[0m")
          gets
          slow_print("\n\e[97mYou lose yourself in the white...\n\e[0m")
          gets
          slow_print("\n\e[97m...\n\e[0m")
          gets
          slow_print("\n\e[97m......\n\e[0m")
          gets
          slow_print("\n\e[97m............\n\e[0m")
          gets

        when 2
          slow_print("\n\e[97mYou start to feel like you are floating.\n\e[0m")
          gets
          slow_print("\n\e[97mIt is a comforting sensation.\n\e[0m")
          gets
          slow_print("\n\e[97mTime seems to stand still in here.\n\e[0m")
          gets
          slow_print("\n\e[97mYou're not sure if its been five minutes or five hours.\n\e[0m")
          gets
          slow_print("\n\e[97m...\n\e[0m")
          gets
          slow_print("\n\e[97m......\n\e[0m")
          gets
          slow_print("\n\e[97m............\n\e[0m")
          gets

        when 3
          slow_print("\n\e[97mThe boundary between you and the room begins to dissolve.\n\e[0m")
          gets
          slow_print("\n\e[97mYou feel like you are part of the room itself,\n\e[0m")
          gets
          slow_print("\n\e[97mand that the room is a part of you.\n\e[0m")
          gets
          slow_print("\n\e[97mIt's as if it has always been this way.\n\e[0m")
          gets
          slow_print("\n\e[97m...\n\e[0m")
          gets
          slow_print("\n\e[97m......\n\e[0m")
          gets
          slow_print("\n\e[97m............\n\e[0m")
          gets

        else
          slow_print("\n\e[97mYou are starting to feel restless.\n\e[0m")
          gets
          slow_print("\n\e[97mMaybe it's time to leave this room.\n\e[0m")
          gets
          slow_print("\n\e[97m...\n\e[0m")
          gets
          slow_print("\n\e[97m......\n\e[0m")
          gets
          slow_print("\n\e[97m............\n\e[0m")
          gets
          slow_print("\n\e[97mYou feel pulled towards the \e[38;5;235mblack metal door\e[97m.\n\e[0m")
          gets
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "black_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          short_load_animation
          return "black_room"
          end
      
      else
        slow_print("\n\e[97mThat is not a choice in this moment...\n\e[0m")
    end
  end
end