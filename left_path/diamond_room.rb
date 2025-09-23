# 6th room in the left path
# This method represents the diamond room in the game.

def diamond_room
  $ascii_diamond_room = [
" ___    ____   ____  ___ ___   ___   ____   ___        ____   ___    ___   ___ ___ ",
"|   \\  |    | /    ||   |   | /   \\ |    \\ |   \\      |    \\ /   \\  /   \\ |   |   |",
"|    \\  |  | |  o  || _   _ ||     ||  _  ||    \\     |  D  )     ||     || _   _ |",
"|  D  | |  | |     ||  \\_/  ||  O  ||  |  ||  D  |    |    /|  O  ||  O  ||  \\_/  |",
"|     | |  | |  _  ||   |   ||     ||  |  ||     |    |    \\|     ||     ||   |   |",
"|     | |  | |  |  ||   |   ||     ||  |  ||     |    |  .  \\     ||     ||   |   |",
"|_____||____||__|__||___|___| \\___/ |__|__||_____|    |__|\\_|\\___/  \\___/ |___|___|",
"                                                                                   " 
  ]
  $ascii_diamond_room.each_with_index do |line, index|
    puts "\e[1;38;5;159m#{line}\e[0m"
  end

  $visited_rooms["diamond_room"] += 1
  visits = $visited_rooms["diamond_room"]

  case visits
  when 1
    slow_print("\n\e[38;5;159mYou find yourself in a room of sparkling diamonds.\n\e[0m")
    gets
    slow_print("\n\e[38;5;159mThe walls are made of diamond, reflecting light in every direction.\n\e[0m")
    gets
    slow_print("\n\e[38;5;159mThe floor is a smooth diamond surface, cold to the touch.\n\e[0m")
    gets
    slow_print("\n\e[38;5;159mThe diamond room just oozes luxury and opulence.\n\e[0m")
    gets
    slow_print("\n\e[38;5;159mYou stand in awe, the diamonds shimmering all around you.\n\e[0m")
    gets
    slow_print("\n\e[38;5;159mBut you are also feeling a bit sleepy...\n\e[0m")
    gets
    slow_print("\n\e[38;5;159mYou notice a door on the opposite side of the room.\n\e[0m")
    gets
    slow_print("\n\e[38;5;159mIt is a wooden door, painted \e[38;5;183mlavender\e[38;5;159m and framed with a \e[1;38;5;251mshining metallic trim\e[38;5;159m.\n\e[0m")
    gets
    slow_print("\n\e[38;5;159mThe doorknob is the same color as the \e[1;38;5;220msun\e[0m.\n\e[0m")
    gets
    slow_print("\n\e[38;5;159mThere is a symbol etched into the middle of the door.\n\e[0m")
    gets
    slow_print("\n\e[38;5;159mIt resembles a crescent \e[38;5;255mmoon\e[38;5;159m surrounded by orbiting rings.\n\e[0m")
    gets
    slow_print("\n\e[38;5;159mIt evokes the cosmos.\n\e[0m")
    gets
    slow_print("\n\e[38;5;159mJust above the doorknob is a small round indentation.\n\e[0m")
    gets

  when 2
    slow_print("\n\e[38;5;159mYou are in the diamond room.\n\e[0m")
    gets

  else
    slow_print("\n\e[38;5;159mYou are in the diamond room.\n\e[0m")
    gets
  end

  #loop for player choices in the diamond room
  loop do
    slow_print("\n\e[38;5;159mYou must make a choice: \n1. explore \n2. back \n3. eat \n4. sleep \n5. stay \n6. menu\n\e[0m\n")
    print "> "
    choice = gets.chomp.downcase

      case choice
      when "explore", "1"
        if $inventory.include?("diamond gem")
          if !$gems_inserted[:diamond]
            slow_print("\n\e[38;5;159mYou place the diamond into the door's socket.\n\e[0m")
            gets
            $gems_inserted[:diamond] = true
            $inventory.delete("diamond gem")
            display_gem_progress
            save_game("autosave") # Autosave after inserting the diamond
            $previous_room = $current_room
            $travel_log << { from: $current_room, to: "observatory", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
            return observatory("diamond_room")

          else
            slow_print("\n\e[38;5;159mThe diamond is already in place.\n\e[0m")
            gets
            return "diamond_room"
        end

        elsif $gems_inserted[:diamond] == true
          slow_print("\n\e[38;5;159mThe diamond is in place.\n\e[0m")
          gets
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "observatory", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          return "observatory"

        else
          slow_print("\n\e[38;5;159mYou approach the shimmering door...\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mThere is a round socket above the doorknob.\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mIt seems something precious is missing...\n\e[0m")
          gets

        end
        return "diamond_room"


      when "back", "2"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "attic", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "attic"

      when "eat", "3"
        return eat("diamond_room")

      when "sleep", "4"
        $sleep_counts["diamond_room"] += 1
        times_slept = $sleep_counts["diamond_room"]

        case times_slept
        when 1
          sleep_action_diamond("diamond_room")
          slow_print("\n\e[38;5;159mYou dreamt of sparkling gems and endless wealth...\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mYou rub your eyes and look around...\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mAs you collect yourself, you feel something in your pocket...\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mYou reach in and find a round, cut diamond.\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mYou wonder how it got there...\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mIt sort of creeps you out.\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mBut you decide to keep it.\n\e[0m")
          gets
          $inventory << "diamond gem"
          slow_print("\n\e[38;5;159m*diamond gem has been added to your bag.*\n\e[0m")
          gets
          save_game("autosave")
          return "diamond_room"

        else
          return sleep_action("diamond_room")
        end

      when "menu", "6"
        menu_handler
        return if $just_loaded_game # If just loaded, return to avoid changing room

      when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room

      when "stay", "5"
        # Increment the stay count for the diamond room
        $stay_counts["diamond_room"] += 1
        times_stayed = $stay_counts["diamond_room"]

        case times_stayed

        when 1
          slow_print("\n\e[38;5;159mYou take a deep breath...\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mThis room is like another dimension.\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mA dimension where time feels distorted.\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mA dimension in which everything manifested as diamond.\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mYou wonder what the value of this room alone is.\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mBut you realize it's not really worth anything to you right now.\n\e[0m")
          gets

        when 2
          slow_print("\n\e[38;5;159mYou stare into the diamond wall...\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mYou can see your reflection in the diamonds...\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mYou don't recognize yourself...\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mBut you know it's you...\n\e[0m")
          gets

        when 3
          slow_print("\n\e[38;5;159mYou take your shoes off...\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mYou walk to one of the corners...\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mYou take a deep breath...\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mThen you begin to sprint, then you leap,\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mAnd then you slide on your feet to the opposite corner.\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mThe polished diamond floor has almost no friction.\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mYou dont know what came over you...\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mBut you are glad you did it.\n\e[0m")
          gets

        else
          slow_print("\n\e[38;5;159mYou sit down in the center of the room...\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mYou close your eyes and try to meditate...\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mBut the diamond walls reflect your thoughts back at you...\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mYou feel overwhelmed by the reflections...\n\e[0m")
          gets
          slow_print("\n\e[38;5;159mYou open your eyes and decide it's time to leave.\n\e[0m")
          gets

          short_load_animation

          all_gems_inserted = $gems_inserted[:ruby] && $gems_inserted[:diamond] && $gems_inserted[:emerald]
          destination = all_gems_inserted ? "observatory" : "attic"

          $previous_room = $current_room
          $travel_log << { from: $current_room, to: destination, time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          return destination

        end

      else
        slow_print("\n\e[38;5;159mThat is not a choice in this moment...\n\e[0m")
    end
  end
end