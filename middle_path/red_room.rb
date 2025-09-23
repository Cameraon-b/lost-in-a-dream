
#1st room in the middle path
#red room method
def red_room
  $ascii_red_room = [
" ____     ___  ___        ____   ___    ___   ___ ___ ",
"|    \\   /  _]|   \\      |    \\ /   \\  /   \\ |   |   |",
"|  D  ) /  [_ |    \\     |  D  )     ||     || _   _ |",
"|    / |    _]|  D  |    |    /|  O  ||  O  ||  \\_/  |",
"|    \\ |   [_ |     |    |    \\|     ||     ||   |   |",
"|  .  \\|     ||     |    |  .  \\     ||     ||   |   |",
"|__|\\_||_____||_____|    |__|\\_|\___/  \\___/ |___|___|"
  ]
  $ascii_red_room.each_with_index do |line, index|
    puts "\e[31m#{line}\e[0m"
  end

  $visited_rooms["red_room"] += 1
  visits = $visited_rooms["red_room"]
  #loop through the visits to the red room
  #and print different messages based on the number of visits
  case visits
  when 1
    slow_print("\n\e[31mYou find yourself in a room of red.\n\e[0m")
    gets
    slow_print("\n\e[31mThe walls are made of a rough, red brick,\n\e[0m")
    gets
    slow_print("\n\e[31mThe floors are made of concrete and painted red.\n\e[0m")
    gets
    slow_print("\n\e[31mAnger and frustration unexpectedly well up from within you...\n\e[0m")
    gets
    slow_print("\n\e[31mYou take a deep breath and let it wash over you.\n\e[0m")
    gets
    slow_print("\n\e[31mThen you realize you are just hungry.\n\e[0m")
    gets
    slow_print("\n\e[31mYou notice a door on the opposite side of the room.\n\e[0m")
    gets
    slow_print("\n\e[31mIt is painted a shade of \e[90mdark grey\e[31m and made of metal.\n\e[0m")
    gets

  when 2
    slow_print("\n\e[31mYou are in the red room.\n\e[0m")
    gets

  else
    slow_print("\n\e[31mYou are in the red room.\n\e[0m")
    gets
  end

  loop do
    slow_print("\n\e[31mYou must make a choice: \n1. explore \n2. back \n3. eat \n4. sleep \n5. stay \n6. menu\n\e[0m")
    print "> "
    choice = gets.chomp.downcase

      case choice
      when "explore", "1"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "grey_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "grey_room"

      when "back", "2"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "main_hall", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "main_hall"

      when "eat", "3"
        eat_red_room("red_room")
        return "red_room"

      when "sleep", "4"
        return sleep_action("red_room")

      when "menu", "6"
        menu_handler
        return if $just_loaded_game # If just loaded, return to avoid changing room

      when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room

      when "stay", "5" # Stays in the red room
        $stay_counts["red_room"] += 1
        times_stayed = $stay_counts["red_room"]

        case times_stayed
        when 1
          slow_print("\n\e[31mYou realize you've been clenching your fists...\n\e[0m")
          gets
          slow_print("\n\e[31mYou take a deep breath, and relax your hands.\n\e[0m")
          gets
          slow_print("\n\e[31mThe red is certainly intense.\n\e[0m")
          gets
          slow_print("\n\e[31m...\n\e[0m")
          gets
          slow_print("\n\e[31m......\n\e[0m")
          gets
          slow_print("\n\e[31m............\n\e[0m")
          gets

        when 2
          slow_print("\n\e[31mYou are in a sea of red.\n\e[0m")
          gets
          slow_print("\n\e[31mPassion and lust swirl around you.\n\e[0m")
          gets
          slow_print("\n\e[31mYou take a deep breath, and try to center yourself.\n\e[0m")
          gets
          slow_print("\n\e[31mYou miss the people you love.\n\e[0m")
          gets
          slow_print("\n\e[31mBut you can't remember their faces right now...\n\e[0m")
          gets

        when 3
          slow_print("\n\e[31mThis room is starting to feel hot.\n\e[0m")
          gets
          slow_print("\n\e[31mBeads of sweat form on your forehead.\n\e[0m")
          gets
          slow_print("\n\e[31mIf it gets any hotter you might want to get moving.\n\e[0m")
          gets

        else
          slow_print("\n\e[31mThe red room becomes blistering hot.\n\e[0m")
          gets
          slow_print("\n\e[31mAlmost like some kind of furnace.\n\e[0m")
          gets
          slow_print("\n\e[31mYou look at the \e[90mgrey door\e[31m.\n\e[0m")
          gets
          slow_print("\n\e[31mYou decide it's time to leave the red room.\n\e[0m")
          gets
          slow_print("\n\e[31mYou walk through the \e[90mgrey door\e[31m.\n\e[0m")
          gets
          short_load_animation
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "grey_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          return "grey_room"
        end

      else
      slow_print("\n\e[31mThat is not a choice in this moment...\n\e[0m")
    end
  end
end