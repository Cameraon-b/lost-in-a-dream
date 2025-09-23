#3rd room in the right path
#pink room method
def pink_room
  $ascii_pink_room = [
    " ____ ____  ____   __  _      ____   ___    ___   ___ ___ ",
    "|    \\    ||    \\ |  |/ ]    |    \\ /   \\  /   \\ |   |   |",
    "|  o  )  | |  _  ||  ' /     |  D  )     ||     || _   _ |",
    "|   _/|  | |  |  ||    \\     |    /|  O  ||  O  ||  \\_/  |",
    "|  |  |  | |  |  ||     \\    |    \\|     ||     ||   |   |",
    "|  |  |  | |  |  ||  .  |    |  .  \\     ||     ||   |   |",
    "|__| |____||__|__||__|\\_|    |__|\\_|\\___/  \\___/ |___|___|"
  ]
  $ascii_pink_room.each_with_index do |line, index|
    puts "\e[38;5;199m#{line}\e[0m"
  end
            
  $visited_rooms["pink_room"] += 1
  visits = $visited_rooms["pink_room"]

  case visits
  when 1
    slow_print("\n\e[38;5;199mYou find yourself in a hot pink room.\n\e[0m")
    gets
    slow_print("\n\e[38;5;199mThe walls, floor, and ceiling are all the same shade of pink.\n\e[0m")
    gets
    slow_print("\n\e[38;5;199mPink shag carpet from floor to ceiling.\n\e[0m")
    gets
    slow_print("\n\e[38;5;199mIt's a bit overwhelming but it makes you feel giddy.\n\e[0m")
    gets
    slow_print("\n\e[38;5;199mYou can't help but recognize the absurdity of the pink room.\n\e[0m")
    gets
    slow_print("\n\e[38;5;199mStanding alone amongst the pink is a \e[1;38;5;251mpolished metal door\e[38;5;199m.\n\e[0m")
    gets
    slow_print("\n\e[38;5;199mIt reflects the pink around it, and almost seems to glow.\n\e[0m")
    gets
    slow_print("\n\e[38;5;199mThere is a \e[38;5;250msilver keyhole\e[38;5;199m in the door.\n\e[0m")
    gets

  when 2
    slow_print("\n\e[38;5;199mYou find yourself in the pink room.\n\e[0m")
    gets

  else
    slow_print("\n\e[38;5;199mYou are in the pink room.\n\e[0m")
    gets
  end

  loop do
    slow_print("\n\e[38;5;199mYou must make a choice: \n1. explore\n2. back\n3. eat\n4. sleep\n5. stay \n6. menu\n\e[0m")
    print "> "
    choice = gets.chomp.downcase

      case choice
       when "explore", "1"

        if $doors_unlocked["baths"]
          slow_print("\n\e[38;5;199mYou step up to the \e[1;38;5;251mpolished metal door\e[38;5;199m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mYou push on the door and it opens easily.\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mYou step through into the baths.\n\e[0m")
          gets
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "baths", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          short_load_animation
          return "baths"

        elsif $inventory.include?("silver key")
          slow_print("\n\e[38;5;199mYou step up to the \e[1;38;5;251mpolished metal door\e[38;5;199m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mYou insert the \e[38;5;250msilver key\e[38;5;199m into the keyhole.\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mYou turn the key and hear a click.\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mYou begin to push on the door, its very heavy\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mYou put all your weight into it,\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mIt slowly starts to move.\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mYou get it open, and you step into the \e[38;5;117mbaths\e[38;5;199m.\n\e[0m")
          gets
          $doors_unlocked["baths"] = true # Unlock the baths door
          $inventory.delete("silver key") # Remove the key after use
          save_game("autosave") # Autosave after unlocking the door
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "baths", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          short_load_animation
          return "baths"


        else
          slow_print("\n\e[38;5;199mYou try to push the door, but it won't budge.\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mYou need to find the \e[38;5;250msilver key\e[38;5;199m.\n\e[0m")
          gets
          return "pink_room"
      end

      when "back", "2"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "purple_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "purple_room"

      when "eat", "3"
        return eat("pink_room")

      when "sleep", "4"
        return sleep_action("pink_room")

        when "menu", "6"
        menu_handler
        return if $just_loaded_game # If just loaded, return to avoid changing room

      when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room

      when "stay", "5"
        $stay_counts["pink_room"] += 1
        times_stayed = $stay_counts["pink_room"]

        case times_stayed

        when 1
          slow_print("\n\e[38;5;199mYou sink into the soft pink carpet, your hands brushing through the plush fibers.\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mIt's warm under your fingers, almost like it's alive.\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mThe air smells faintly of strawberries and sugar.\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mYou take a deep breath, letting the sweet scent fill your lungs.\n\e[0m")
          gets

        when 2
          slow_print("\n\e[38;5;199mYou lie back on the carpet and stare up at the pink ceiling.\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mIt is a pink world, filled with pink, pink, pink.\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mThe pink is very endearing but slightly over the top.\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mYou wouldn't want this to be your room, but there is no judgement.\n\e[0m")
          gets

        when 3
          slow_print("\n\e[38;5;199mYou curl up on the carpet, feeling the pink press in from every direction.\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mThe walls seem closer than before, perhaps the pink might want a hug.\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mYou close your eyes and imagine the room hugging you back.\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mYou step up to the wall and put your body against it.\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mYou rub your hands on the soft, shag carpet covering the walls.\n\e[0m")
          gets

        else
          slow_print("\n\e[38;5;199mThe pink room suddenly gets much colder...\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mYou feel like you have overstayed your welcome...\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mMaybe the pink room just needs some space...\n\e[0m")
          gets
          slow_print("\n\e[38;5;199mYou decide it's time to move on.\n\e[0m")
          gets
          short_load_animation

          if $doors_unlocked["baths"]
            $previous_room = $current_room
            $travel_log << { from: $current_room, to: "baths", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
            return "baths"

          else
            $previous_room = $current_room
            $travel_log << { from: $current_room, to: "purple_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
            return "purple_room"
          end
        end

      else
      slow_print("\n\e[38;5;199mThat is not a choice in this moment...\n\e[0m")
    end
  end
end