# 3rd room in the middle path
#def brown_room method
def brown_room
  $ascii_brown_room = [
    " ____   ____   ___   __    __  ____       ____   ___    ___   ___ ___        ",
    "|    \\ |    \\ /   \\ |  |__|  ||    \\     |    \\ /   \\  /   \\ |   |   |",
    "|  o  )|  D  )     ||  |  |  ||  _  |    |  D  )     ||     || _   _ |       ",
    "|     ||    /|  O  ||  |  |  ||  |  |    |    /|  O  ||  O  ||  \\_/  |      ",
    "|  O  ||    \\|     ||  `  '  ||  |  |    |    \\|     ||     ||   |   |     ",
    "|     ||  .  \\     | \\      / |  |  |    |  .  \\     ||     ||   |   |    ",
    "|_____||__|\\_|\\___/   \\_/\\_/  |__|__|    |__|\\_|\\___/  \\___/ |___|___|",
    "                                                                             "
  ]
  $ascii_brown_room.each_with_index do |line, index|
    puts "\e[1;38;5;180m#{line}\e[0m"
  end

  $visited_rooms["brown_room"] += 1
  visits = $visited_rooms["brown_room"]

  case visits
  when 1
    slow_print("\n\e[38;5;180mYou find yourself in a room of brown.\n\e[0m")
    gets
    slow_print("\n\e[38;5;180mThe walls are made of a beautiful hard wood,\n\e[0m")
    gets
    slow_print("\n\e[38;5;180mThe floors are also wood, laid out in intricate patterns.\n\e[0m")
    gets
    slow_print("\n\e[38;5;180mYou wonder where all the wood came from...\n\e[0m")
    gets
    slow_print("\n\e[38;5;180mYou suddenly remember the tree you used to climb on as a child.\n\e[0m")
    gets
    slow_print("\n\e[38;5;180mYou notice a door on the opposite side of the room.\n\e[0m")
    gets
    slow_print("\n\e[38;5;180mIt is made of different shades of \e[38;5;34mgreen \e[38;5;35mstained \e[38;5;36mglass\e[38;5;180m, with a \e[1;38;5;251mmetal frame\e[38;5;180m.\n\e[0m")
    gets
    slow_print("\n\e[1;38;5;220msunlight\e[38;5;180m filters through the glass, casting colorful patterns on the floor.\n\e[0m")
    gets
    slow_print("\n\e[38;5;180mThe doorknob is made of \e[38;5;34msmooth \e[38;5;35mgreen \e[38;5;36mglass\e[38;5;180m, the same hue as the stained panels around it.\n\e[0m")
    gets
    slow_print("\n\e[38;5;180mLight filters through it, casting a soft glow on the door.\n\e[0m")
    gets
    slow_print("\n\e[38;5;180mThere is a \e[38;5;235msmall black keyhole\e[38;5;180m in the door.\n\e[0m")
    gets

  when 2
    if !$forest_found
      slow_print("\n\e[38;5;180mYou are in the brown room.\n\e[0m")
      gets
      slow_print("\n\e[38;5;180mYou should stay awhile.\n\e[0m")
      gets

    else
      slow_print("\n\e[38;5;180mYou are in the brown room.\n\e[0m")
      gets
    end

  else
    if !$forest_found
      slow_print("\n\e[38;5;180mYou are in the brown room.\n\e[0m")
      gets
      slow_print("\n\e[38;5;180mYou feel like staying awhile.\n\e[0m")
      gets

    else
      slow_print("\n\e[38;5;180mYou are in the brown room.\n\e[0m")
      gets
    end
  end

  loop do
    slow_print("\n\e[38;5;180mYou must make a choice: \n1. explore \n2. back \n3. eat \n4. sleep \n5. stay \n6. menu\n\e[0m")
    print "> "
    choice = gets.chomp.downcase

      case choice
      when "explore", "1"
        if $doors_unlocked["greenhouse"]
          # Door already unlocked, simple message
          slow_print("\n\e[38;5;180mYou open the door and step into the greenhouse.\n\e[0m")
          gets
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "greenhouse", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          short_load_animation
          return "greenhouse"

        elsif $inventory.include?("black key")
          # First time unlocking
          slow_print("\n\e[38;5;180mYou use the \e[38;5;235mblack key\e[38;5;180m to unlock the door.\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mYou turn the \e[38;5;235mkey\e[38;5;180m to the left and hear a loud click.\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mYou grab the handle and push the door open.\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mYou take a deep breath, and step through the door.\n\e[0m")
          gets
          $doors_unlocked["greenhouse"] = true
          $inventory.delete("black key") # Remove the key after use
          save_game("autosave") # Autosave after unlocking the door
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "greenhouse", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          short_load_animation
          return "greenhouse"

        else
          # No key, door still locked
          slow_print("\n\e[38;5;180mThe door is locked, you need a \e[38;5;235mblack key\e[38;5;180m to open it.\n\e[0m")
          gets
        end

      when "back", "2"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "grey_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "grey_room"

      when "eat", "3"
        return eat("brown_room")

      when "sleep", "4"
        return sleep_action("brown_room")

      when "menu", "6"
        menu_handler
        return if $just_loaded_game # If just loaded, return to avoid changing room

      when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room

      when "stay", "5"
        $stay_counts["brown_room"] += 1
        times_stayed = $stay_counts["brown_room"]

        case times_stayed
        when 1
          slow_print("\n\e[38;5;180mYou crouch down to examine the wooden floor.\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mThe grain forms patterns, you struggle to make sense of them.\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mShapes, letters, a map?\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mAs you blink, it shifts back to just wood.\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mIs the room trying to communicate with you?\n\e[0m")
          gets


        when 2
          slow_print("\n\e[38;5;180mYou notice a pulse in the wood. Just once. Then still.\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mIs this room alive?\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mYou watch patiently, you breathe softly.\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mThen the wood begins to breathe with you.\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mYou seem to have a connection with the room.\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mYou realize you are not alone here.\n\e[0m")
          gets


         when 3
          slow_print("\n\e[38;5;180mYou hear whispering in the grain...\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mYour arms begin to get heavy...\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mYou feel like you need to sit down.\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mIts almost as if the wood is pulling you down...\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mYou don't try and fight it, you just lay down on the wood floor.\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mYou feel better now, but you're concerned about the room's intentions.\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mDoes it want you to stay?\n\e[0m")
          gets

        when 4
          slow_print("\n\e[38;5;180mYour whole body feels heavy now.\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mWorried the room might reject you, you quietly return to the floor.\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mThe wood beneath you is warm... welcoming...\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mA single leaf falls from the ceiling.\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mYou watch it descend, slowly, slowly...\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mWhen it touches the floor, you lose consciousness.\n\e[0m")
          gets
          slow_print("\n\e[38;5;180m...\n\e[0m")
          gets
          slow_print("\n\e[38;5;180m......\n\e[0m")
          gets
          slow_print("\n\e[38;5;180m............\n\e[0m")
          gets
          
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "forest", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          short_load_animation
          return "forest" # Send player to the forest (hidden room)

        else
          slow_print("\n\e[38;5;180mThe brown room doesn't seem to respond to your presence...\n\e[0m")
          gets
          slow_print("\n\e[38;5;180mYou feel it's time to leave the brown room.\n\e[0m")
          gets
          short_load_animation
          if $doors_unlocked["greenhouse"]
            $previous_room = $current_room
            $travel_log << { from: $current_room, to: "greenhouse", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
            return "greenhouse" # Send player to the greenhouse
          else
            $previous_room = $current_room
            $travel_log << { from: $current_room, to: "grey_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
            short_load_animation
            return "grey_room" # Send player to the grey room
          end
        end

      else
        slow_print("\n\e[38;5;180mThat is not a choice in this moment...\n\e[0m")
      end
  end
end