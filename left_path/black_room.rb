#3rd room in the left path
#black room method
def black_room
  $ascii_black_room = [
" ____   _       ____    __  __  _      ____   ___    ___   ___ ___  ",  
"|    \\ | |     /    |  /  ]|  |/ ]    |    \\ /   \\  /   \\ |   |   | ", 
"|  o  )| |    |  o  | /  / |  ' /     |  D  )     ||     || _   _ | ",   
"|     || |___ |     |/  /  |    \\     |    /|  O  ||  O  ||  \\_/  | ", 
"|  O  ||     ||  _  /   \\_ |     \\    |    \\|     ||     ||   |   | ", 
"|     ||     ||  |  \\     ||  .  |    |  .  \\     ||     ||   |   | ", 
"|_____||_____||__|__|\\____||__|\\_|    |__|\\_|\\___/  \\___/ |___|___| ", 
"                                                                    "
  ]
  $ascii_black_room.each_with_index do |line, index|
    puts "\e[1;38;5;239m#{line}\e[0m"
  end

  # tracks how many times the player has visited the black room
  $visited_rooms["black_room"] += 1
  visits = $visited_rooms["black_room"]

  case visits
  when 1
    slow_print("\n\e[38;5;239mYou find yourself in a room of black.\e[0m\n")
    gets
    slow_print("\n\e[38;5;239mThe walls and floor are made of a polished black marble.\e[0m\n")
    gets
    slow_print("\n\e[38;5;239mThe ceiling is a dark void, its like nothing is there at all.\e[0m\n")
    gets
    slow_print("\n\e[38;5;239mYou feel a sense of dread and fear.\e[0m\n")
    gets
    slow_print("\n\e[38;5;239mYou feel like you are being watched...\e[0m\n")
    gets
    slow_print("\n\e[38;5;239mYou notice a door on the opposite side of the room.\e[0m\n")
    gets
    slow_print("\n\e[38;5;239mIt is an old,\e[38;5;138m ornate wooden door\e[38;5;239m, with intricate designs carved into it.\e[0m\n")
    gets
    slow_print("\n\e[38;5;239mIt invites you to the \e[38;5;138mlibrary\e[38;5;239m.\e[0m\n")
    gets

  when 2
    slow_print("\n\e[38;5;239mYou find yourself in the black room.\e[0m\n")
    gets
    slow_print("\n\e[38;5;239mYou feel a sense of unease, but you are not afraid.\e[0m\n")
    gets
    slow_print("\n\e[38;5;239mYou notice a small \e[1;33mgold handle\e[38;5;239m on the same wall as the \e[97mwhite door\e[38;5;239m.\e[0m\n")
    gets
    slow_print("\n\e[38;5;239mYou wonder how you missed it before.\e[0m\n")
    gets
    slow_print("\n\e[38;5;239mIt looks like it might open something.\e[0m\n")
    gets
    slow_print("\n\e[38;5;239mYou feel a sense of curiosity about the handle.\e[0m\n")
    gets
    slow_print("\n\e[38;5;239mYou decide to walk over to the handle.\e[0m\n")
    gets
    slow_print("\n\e[38;5;239mThe handle is centered on a block of marble.\e[0m\n")
    gets
    slow_print("\n\e[38;5;239mYou decide to pull the handle.\e[0m\n")
    gets
    slow_print("\n\e[38;5;239mThe block of marble slides out, revealing a hidden compartment.\e[0m\n")
    gets
    slow_print("\n\e[38;5;239mInside the compartment is an \e[38;5;180mold book\e[38;5;239m.\e[0m\n")
    gets
    slow_print("\n\e[38;5;239mYou take the book and put it in your bag.\e[0m\n")
    gets
    slow_print("\n\e[38;5;239m*\e[38;5;180mold book\e[38;5;239m has been added to your bag.*\e[0m\n")
    gets
    $inventory << "old book"
    save_game("autosave") # Autosave after finding the book
    slow_print("\n\e[38;5;239mYou put the block of marble back in place.\e[0m\n")
    gets

  else
    slow_print("\n\e[38;5;239mYou are in the black room.\e[0m\n")
    gets
  end

  # Loop for player choices in the black room
  loop do
    slow_print("\n\e[38;5;239mYou must make a choice: \n1. explore \n2. back \n3. eat \n4. sleep \n5. stay \n6. menu\e[0m\n")
    print "> "
    choice = gets.chomp.downcase

      case choice

      when "explore", "1"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "library", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "library"

      when "back", "2"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "white_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "white_room"

      when "eat", "3"
        return eat("black_room")

      when "sleep", "4"
        return sleep_action("black_room")

      when "menu", "6"
        menu_handler
        return if $just_loaded_game # If just loaded, return to avoid changing room

      when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room

      when "stay", "5" # Stays in the black room
        $stay_counts["black_room"] += 1
        times_stayed = $stay_counts["black_room"]

        case times_stayed

        when 1
          slow_print("\n\e[38;5;239mYou take a deep breath...\e[0m\n")
          gets
          slow_print("\n\e[38;5;239mThere is a strange calm in the black room.\e[0m\n")
          gets
          slow_print("\n\e[38;5;239mYou feel like something significant happened in here.\e[0m\n")
          gets
          slow_print("\n\e[38;5;239mYou wonder what this room has seen...\e[0m\n")
          gets
          slow_print("\n\e[38;5;239m...\e[0m\n")
          gets

        when 2
          slow_print("\n\e[38;5;239mYou feel like you are in a void.\e[0m\n")
          gets
          slow_print("\n\e[38;5;239mYou start to forget about whats beyond this room.\e[0m\n")
          gets
          slow_print("\n\e[38;5;239mAs if the black is consuming the outside world.\e[0m\n")
          gets
          slow_print("\n\e[38;5;239mAn insatiable darkness...\e[0m\n")
          gets
          slow_print("\n\e[38;5;239mPulling you in...\e[0m\n")
          gets

        else
          slow_print("\n\e[38;5;239mThere is a growing sense of dread.\e[0m\n")
          gets
          slow_print("\n\e[38;5;239mSomeone might be watching you...\e[0m\n")
          gets
          slow_print("\n\e[38;5;239mNo, you are just being paranoid.\e[0m\n")
          gets
          slow_print("\n\e[38;5;239m...\e[0m\n")
          gets
          slow_print("\n\e[38;5;239m......\e[0m\n")
          gets
          slow_print("\n\e[38;5;239m............\e[0m\n")
          gets
          slow_print("\n\e[38;5;239mYou can't help but run to the \e[38;5;138m ornate wooden door\e[38;5;239m and push it open.\e[0m\n")
          gets
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "library", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          short_load_animation
          return "library"

        end

      else
      slow_print("\n\e[38;5;239mThat is not a choice in this moment...\e[0m\n")
    end
  end
end