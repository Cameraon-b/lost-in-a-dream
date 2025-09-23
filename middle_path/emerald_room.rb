#6th room in the middle path
# This method represents the emerald room in the game.

def emerald_room
  $ascii_emerald_room = [
"   ___  ___ ___    ___  ____    ____  _      ___        ____   ___    ___   ___ ___ ",
"  /  _]|   |   |  /  _]|    \\  /    || |    |   \\      |    \\ /   \\  /   \\ |   |   |",
" /  [_ | _   _ | /  [_ |  D  )|  o  || |    |    \\     |  D  )     ||     || _   _ |",
"|    _]|  \\_/  ||    _]|    / |     || |___ |  D  |    |    /|  O  ||  O  ||  \\_/  |",
"|   [_ |   |   ||   [_ |    \\ |  _  ||     ||     |    |    \\|     ||     ||   |   |",
"|     ||   |   ||     ||  .  \\|  |  ||     ||     |    |  .  \\     ||     ||   |   |",
"|_____||___|___||_____||__|\\_||__|__||_____||_____|    |__|\\_|\___/  \\___/ |___|___|",
"                                                                                    " 
  ]
  $ascii_emerald_room.each_with_index do |line, index|
    puts "\e[1;38;5;40m#{line}\e[0m"
  end

  $visited_rooms["emerald_room"] += 1
  visits = $visited_rooms["emerald_room"]

    case visits
    when 1
      slow_print("\n\e[38;5;40mYou find yourself in a room of emerald green.\n\e[0m")
      gets
      slow_print("\n\e[38;5;40mThe walls are made of a smooth, emerald green granite.\n\e[0m")
      gets
      slow_print("\n\e[38;5;40mThe floors are made of an opaque green glass, and seem to be glowing softly.\n\e[0m")
      gets
      slow_print("\n\e[38;5;40mThe ceiling looks to be one massive slab of emerald.\n\e[0m")
      gets
      slow_print("\n\e[38;5;40mThe emerald room is the embodiment of serenity and liveliness.\n\e[0m")
      gets
      slow_print("\n\e[38;5;40mYou get the sense that the room wants you to stay...\n\e[0m")
      gets
      slow_print("\n\e[38;5;40mYou notice a door on the opposite side of the room.\n\e[0m")
      gets
      slow_print("\n\e[38;5;40mIt is a wooden door, painted \e[38;5;183mlavender\e[38;5;40m,\n\e[0m")
      gets
      slow_print("\n\e[38;5;40mand framed with a \e[1;38;5;251mshining metallic trim\e[38;5;40m.\n\e[0m")
      gets
      slow_print("\n\e[38;5;40mThe doorknob is the same color as the \e[1;38;5;220msun\e[0m.\n\e[0m")
      gets
      slow_print("\n\e[38;5;40mIt is giving off a faint, warm glow.\n\e[0m")
      gets
      slow_print("\n\e[38;5;40mThere is a symbol etched into the middle of the door.\n\e[0m")
      gets
      slow_print("\n\e[38;5;40mIt resembles a crescent \e[38;5;255mmoon\e[38;5;40m surrounded by orbiting rings.\n\e[0m")
      gets
      slow_print("\n\e[38;5;40mIt evokes the cosmos.\n\e[0m")
      gets
      slow_print("\n\e[38;5;40mJust above the doorknob is a small square indentation.\n\e[0m")
      gets

    when 2
      slow_print("\n\e[38;5;40mYou are in the emerald room.\n\e[0m")
      gets

    else
      slow_print("\n\e[38;5;40mYou are in the emerald room.\n\e[0m")
      gets
    end


  loop do
    slow_print("\n\e[38;5;40mYou must make a choice: \n1. explore\n2. back\n3. eat\n4. sleep \n5. stay \n6. menu\n\e[0m")
    print "> "
    choice = gets.chomp.downcase

      case choice
      when "explore", "1"
        if $inventory.include?("emerald gem")
          if !$gems_inserted[:emerald]
            slow_print("\n\e[38;5;40mYou place the emerald into the door's socket.\n\e[0m")
            gets
            $gems_inserted[:emerald] = true
            $inventory.delete("emerald gem")
            display_gem_progress
            save_game("autosave") # Autosave after inserting the ruby
            $previous_room = $current_room
            $travel_log << { from: $current_room, to: "observatory", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
            return observatory("emerald_room")

          else
            slow_print("\n\e[38;5;40mThe emerald is already in place.\n\e[0m")
            gets
            return "emerald_room"
        end

        elsif $gems_inserted.values.all?
          slow_print("\n\e[38;5;40mYou step through the \e[38;5;183mlavender\e[38;5;40m door.\n\e[0m")
          gets
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "observatory", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          short_load_animation
          return "observatory"

        elsif $gems_inserted[:emerald] == true
          slow_print("\n\e[38;5;40mThe emerald is in place.\n\e[0m")
          gets

        else
          slow_print("\n\e[38;5;40mYou approach the \e[38;5;183mlavender\e[38;5;40m door...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mYou try to turn the knob, but it is locked.\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mThere is a small square socket above the doorknob.\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mIt seems something precious is missing...\n\e[0m")
          gets

        end

      when "back", "2"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "garden", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "garden"

      when "eat", "3"
        return eat("emerald_room")

      when "sleep", "4"
        return sleep_action("emerald_room")

      when "menu", "6"
        menu_handler
        return if $just_loaded_game # If just loaded, return to avoid changing room

      when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room

      when "stay", "5"
        $stay_counts["emerald_room"] += 1
        times_stayed = $stay_counts["emerald_room"]

        case times_stayed
        when 1
          slow_print("\n\e[38;5;40mYou close your eyes and take a deep breath...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mThe calming energy of the room envelops you...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mYou feel more at peace than ever before.\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mYou feel you could stay longer...\n\e[0m")
          gets

        when 2
          slow_print("\n\e[38;5;40mYou sit down on the floor and lean against the wall...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mYou take a moment to collect your thoughts...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mThe lively green energy of the room seems to respond to your presence...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mYou want to stay a bit longer...\n\e[0m")
          gets

        when 3
          slow_print("\n\e[38;5;40mYou feel a deep connection to the room...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mThe emerald green walls seem to pulse with energy...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mYou feel like you could stay here forever...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mYou take a deep breath and let the energy of the room wash over you...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mYou know that you are exactly where you need to be.\n\e[0m")
          gets

        when 4
          slow_print("\n\e[38;5;40mYou feel a sense of belonging in the emerald room...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mThe emerald green walls seem to embrace you...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mYou feel like you are part of the room, and the room is part of you...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mYou close your eyes and let the energy of the room fill you...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mIts like this is all there ever was and will be.\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mAn emerald eternity...\n\e[0m")
          gets

        when 5
          slow_print("\n\e[38;5;40mYou lose yourself in the emerald green...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mWaves of intense bliss flow through you...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mYou feel the green energy in every cell of your being...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mYou begin to feel a pressure behind your eyes...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mYou close your eyes and try to focus on that spot.\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mYou feel the pressure building, it is actually very pleasant...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mYour focus becomes one pointed...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mThen you feel something shoot up from the bottom of your spine...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mIt travels up into your head and you see a bright flash of electric green...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mThe pressure in your head meets with the energy from your spine\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mThen in a single instant you fall to your knees and something goes pinging all around the room\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mYou hear it settle in the middle of the room, it almost sounds like a piece of glass.\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mYou open your eyes and see a small, square, cut emerald gem.\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mIt seems like that came out of your head...\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mBut you're not sure what just happened.\n\e[0m")
          gets
          slow_print("\n\e[38;5;40mYou go and pick up the gem and place it in your bag.\n\e[0m")
          gets
          slow_print("\n\e[38;5;40m*emerald gem has been added to your bag.*\n\e[0m")
          gets
          $inventory << "emerald gem"
          save_game("autosave") # Autosave after finding the emerald gem

        else
          slow_print("\n\e[38;5;40mYou decide its time to move on...\n\e[0m")
          gets

          short_load_animation

          all_gems_inserted = $gems_inserted[:ruby] && $gems_inserted[:diamond] && $gems_inserted[:emerald]
          destination = all_gems_inserted ? "observatory" : "garden"

          $previous_room = $current_room
          $travel_log << { from: $current_room, to: destination, time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          return destination

        end

      else
        slow_print("\n\e[38;5;40mThat is not a choice in this moment...\n\e[0m")
      end
  end
end