#6th room in the right path
# This method represents the ruby room in the game.
def ruby_room
  $ascii_ruby_room = [
" ____  __ __  ____   __ __      ____   ___    ___   ___ ___ ",
"|    \\|  |  ||    \\ |  |  |    |    \\ /   \\  /   \\ |   |   |",
"|  D  )  |  ||  o  )|  |  |    |  D  )     ||     || _   _ |",
"|    /|  |  ||     ||  ~  |    |    /|  O  ||  O  ||  \\_/  |",
"|    \\|  :  ||  O  ||___, |    |    \\|     ||     ||   |   |",
"|  .  \\     ||     ||     |    |  .  \\     ||     ||   |   |",
"|__|\\_|\\__,_||_____||____/     |__|\\_|\\___/  \\___/ |___|___|"
]
  $ascii_ruby_room.each_with_index do |line, index|
    puts "\e[38;5;196m#{line}\e[0m"
  end

  $visited_rooms["ruby_room"] += 1
  visits = $visited_rooms["ruby_room"]

  case visits
  when 1
    slow_print("\n\e[38;5;196mYou find yourself in a room of deep red.\n\e[0m")
    gets
    slow_print("\n\e[38;5;196mThe walls are made of red velvet.\n\e[0m")
    gets
    slow_print("\n\e[38;5;196mThe floor is a polished, red marble.\n\e[0m")
    gets
    slow_print("\n\e[38;5;196mThe ceiling is reminiscent of a cathedral and lined with rubies.\n\e[0m")
    gets
    slow_print("\n\e[38;5;196mThere is a large ruby chandelier hanging from the ceiling.\n\e[0m")
    gets
    slow_print("\n\e[38;5;196mThe light from the chandelier casts a warm glow over the room.\n\e[0m")
    gets
    slow_print("\n\e[38;5;196mThe red feels alive.\n\e[0m")
    gets
    slow_print("\n\e[38;5;196mThe room exudes power and luxury.\n\e[0m")
    gets
    slow_print("\n\e[38;5;196mYet, your stomach begins to growl, you feel hungry...\n\e[0m")
    gets
    slow_print("\n\e[38;5;196mThere is a door on the opposite side of the room.\n\e[0m")
    gets
    slow_print("\n\e[38;5;196mIt is a wooden door, painted \e[38;5;183mlavender\e[38;5;196m and framed with a \e[1;38;5;251mshining metallic trim\e[38;5;196m.\n\e[0m")
    gets
    slow_print("\n\e[38;5;196mThe doorknob is the same color as the \e[1;38;5;220msun\e[0m.\n\e[0m")
    gets
    slow_print("\n\e[38;5;196mThere is a symbol etched into the middle of the door.\n\e[0m")
    gets
    slow_print("\n\e[38;5;196mIt resembles a crescent \e[38;5;255mmoon\e[38;5;196m surrounded by orbiting rings.\n\e[0m")
    gets
    slow_print("\n\e[38;5;196mIt evokes the cosmos.\n\e[0m")
    gets
    slow_print("\n\e[38;5;196mJust above the doorknob is a small triangle keyhole.\n\e[0m")
    gets

  when 2
    slow_print("\n\e[38;5;196mYou are in the ruby room.\n\e[0m")
    gets

  else
    slow_print("\n\e[38;5;196mYou are in the ruby room.\n\e[0m")
    gets
  end

  # loop for player choices in the ruby room
  # player can explore, go back, eat, sleep, check inventory, or access the menu
  loop do
    slow_print("\n\e[38;5;196mYou must make a choice: \n1. explore\n2. back\n3. eat\n4. sleep \n5. stay\n6. menu\n\e[0m")
    print "> "
    choice = gets.chomp.downcase

      case choice
        # This allows the player to explore
      when "explore", "1"
        if $inventory.include?("ruby gem")# check if the player has the ruby gem
          if !$gems_inserted[:ruby] # check if the ruby gem is not inserted
            slow_print("\n\e[38;5;196mYou place the ruby into the door's round keyhole.\n\e[0m")
            gets
            $gems_inserted[:ruby] = true # mark the ruby gem as inserted
            $inventory.delete("ruby gem") # remove the ruby gem from inventory
            display_gem_progress
            save_game("autosave") # Autosave after inserting the ruby
            $previous_room = $current_room
            $travel_log << { from: $current_room, to: "observatory", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
            return observatory("ruby_room")

          else # if the ruby gem is already inserted but the other gems are not
            slow_print("\n\e[38;5;196mThe ruby is already in place.\n\e[0m")
            gets
            return "ruby_room"
        end

        elsif $gems_inserted[:ruby] == true # if the ruby gem is already inserted and the other gems are too
          slow_print("\n\e[38;5;196mThe ruby is in place.\n\e[0m")
          gets
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "observatory", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          return "observatory"

        else # if the player does not have the ruby gem
          slow_print("\n\e[38;5;196mYou approach the shimmering door...\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mYou try and turn the knob, but it is locked.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mThere is a triangle keyhole above the doorknob.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mIt seems something precious is missing...\n\e[0m")
          gets
          return "ruby_room"

        end

      when "back", "2"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "courtyard", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "courtyard"

      when "eat", "3"
        return eat_ruby_room("ruby_room")
        gets

      when "sleep", "4"
        return sleep_action("ruby_room")

      when "menu", "6"
        menu_handler
        return if $just_loaded_game # If just loaded, return to avoid changing room

      when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room

      when "stay", "5"
        $stay_counts["ruby_room"] += 1
        times_stayed = $stay_counts["ruby_room"]
        case times_stayed

        when 1
          slow_print("\n\e[38;5;196mYou linger in the ruby room, letting your gaze wander over the deep red walls.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mThe color seems to breathe, warm and steady, like a heartbeat.\n\e[0m")
          gets

        when 2
          slow_print("\n\e[38;5;196mYou lower yourself onto the red marble floor.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mIt's cool at first, but slowly grows warmer beneath you.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mYou begin to hear a faint hum...\n\e[0m")
          gets

        when 3
          slow_print("\n\e[38;5;196mYou lean against the wall, feeling the red velvet against the back of your hand.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mIt's soft and feels good to touch.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mIt has a sheen to it.\n\e[0m")
          gets

        when 4
          slow_print("\n\e[38;5;196mYou close your eyes and breathe in.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mThere's a faint scent of smoke and roses lingering in the air.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mYou are not sure what to make of it.\n\e[0m")
          gets

        else
          slow_print("\n\e[38;5;196mThe ruby room feels like it has absorbed your presence.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mThe room begins to warm up dramatically...\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mYou feel a charge in the air, your skin tingling with energy...\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mIt is actually rather concerning...\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mYou decide it's time to move on...\n\e[0m")
          gets
          short_load_animation

          all_gems_inserted = $gems_inserted[:ruby] && $gems_inserted[:diamond] && $gems_inserted[:emerald]
          destination = all_gems_inserted ? "observatory" : "baths"

          $previous_room = $current_room
          $travel_log << { from: $current_room, to: destination, time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          return destination
        end

      else
        slow_print("\n\e[38;5;196mThat is not a choice in this moment...\n\e[0m")
    end
  end
end