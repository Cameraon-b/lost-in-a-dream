#1st room in the left path
#blue room method
def blue_room
  $ascii_blue_room = [
" ____   _      __ __    ___      ____   ___    ___   ___ ___  ",
"|    \\ | |    |  |  |  /  _]    |    \\ /   \\  /   \\ |   |   | ",
"|  o  )| |    |  |  | /  [_     |  D  )     ||     || _   _ | ",
"|     || |___ |  |  ||    _]    |    /|  O  ||  O  ||  \\_/  | ",
"|  O  ||     ||  :  ||   [_     |    \\|     ||     ||   |   | ",
"|     ||     ||     ||     |    |  .  \\     ||     ||   |   | ",
"|_____||_____| \\__,_||_____|    |__|\\_|\\___/  \\___/ |___|___| ",
"                                                              "
  ]
  $ascii_blue_room.each_with_index do |line, index|
    puts "\e[1;34m#{line}\e[0m"
  end

  $visited_rooms["blue_room"] += 1
  visits = $visited_rooms["blue_room"]

# The player can explore, eat, sleep, or stay in the room.
  case visits
  when 1
    slow_print("\n\e[34mYou find yourself in a room of blue.\n\e[0m")
    gets
    slow_print("\n\e[34mThe walls are seemingly made of plastic.\n\e[0m")
    gets
    slow_print("\n\e[34mThe floor is a soft blue carpet.\n\e[0m")
    gets
    slow_print("\n\e[34mYou feel a deep sadness well up from your heart...\n\e[0m")
    gets
    slow_print("\n\e[34mThe blue is just making you want to eat and sleep all day...\n\e[0m")
    gets
    slow_print("\n\e[34mIt reminds you of a rainy day.\n\e[0m")
    gets
    slow_print("\n\e[34mYou notice a door on the opposite side of the room.\n\e[0m")
    gets
    slow_print("\n\e[34mIt is a \e[97mbright white wooden door\e[34m.\n\e[0m")
    gets

  when 2
    slow_print("\n\e[34mYou find yourself in the blue room.\n\e[0m")
    gets
    slow_print("\n\e[34mBlue, blue, blue...\n\e[0m")
    gets
    slow_print("\n\e[34mYou feel like you are in an ocean of blue.\n\e[0m")
    gets
    slow_print("\n\e[34mIt makes you feel small, insignificant even.\n\e[0m")
    gets
    slow_print("\n\e[34mBut you remember something someone once told you...\n\e[0m")
    gets
    slow_print("\n\e[34mYou may think you are just a drop in the ocean.\n\e[0m")
    gets
    slow_print("\n\e[34mBut you are also the whole ocean...\n\e[0m")
    gets

  when 3
    slow_print("\n\e[34mYou are in the blue room.\n\e[0m")
    gets
    slow_print("\n\e[34mYou sit down on the soft blue carpet and close your eyes...\n\e[0m")
    gets
    slow_print("\n\e[34mYou sit for a while, letting the calm wash over you.\n\e[0m")
    gets
    slow_print("\n\e[34m...\n\e[0m")
    gets
    slow_print("\n\e[34m......\n\e[0m")
    gets
    slow_print("\n\e[34m............\n\e[0m")
    gets
    slow_print("\n\e[34mThen you hear a thud.\n\e[0m")
    gets
    slow_print("\n\e[34mSomething fell onto the carpet...\n\e[0m")
    gets
    slow_print("\n\e[34mYou open your eyes and see a \e[38;5;166mcopper ring\e[34m.\n\e[0m")
    gets
    slow_print("\n\e[34mYou wonder where it came from...\n\e[0m")
    gets
    slow_print("\n\e[34mYou pick it up and put it in your bag.\n\e[0m")
    gets

    slow_print("\n\e[34m*\e[38;5;166mcopper ring\e[34m has been added to your bag.*\n\e[0m")
    $inventory << "copper ring"
    save_game("autosave") # Autosave after finding the ring
  
  else
    slow_print("\n\e[34mYou are back in the blue room.\n\e[0m")
    gets
  end

# Loop for player choices in the blue room
  loop do
    slow_print("\n\e[34mYou must make a choice: \n1. explore \n2. back \n3. eat \n4. sleep \n5. stay \n6. menu\n\e[0m")
    print "> "
    choice = gets.chomp.downcase

      case choice

      when "explore", "1"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "white_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S")}
        short_load_animation
        return "white_room"

      when "back", "2"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "main_hall", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "main_hall"

      when "eat", "3"
        return eat("blue_room")

      when "sleep", "4"
        return sleep_action("blue_room")

      when "menu", "6"
        menu_handler
        return if $just_loaded_game # If just loaded, return to avoid changing room

      when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room

# This case handles the player's choice to stay in the blue room.
      when "stay", "5"
        $stay_counts["blue_room"] += 1
        times_stayed = $stay_counts["blue_room"]

        case times_stayed

        when 1
          slow_print("\n\e[34mYou take a deep breath...\n\e[0m")
          gets
          slow_print("\n\e[34mYou feel a tear form in your right eye.\n\e[0m")
          gets
          slow_print("\n\e[34mIt rolls down your cheek and falls to the floor.\n\e[0m")
          gets
          slow_print("\n\e[34m...\n\e[0m")
          gets
          slow_print("\n\e[34m......\n\e[0m")
          gets
          slow_print("\n\e[34m............\n\e[0m")
          gets

        when 2
          slow_print("\n\e[34mIt's like you are floating in an ocean of blue.\n\e[0m")
          gets
          slow_print("\n\e[34mYou can feel yourself becoming the blue.\n\e[0m")
          gets
          slow_print("\n\e[34mThe bluest of blues.\n\e[0m")
          gets
          slow_print("\n\e[34mCan it be more blue?\n\e[0m")
          gets

        else
          slow_print("\n\e[34mYou are starting to feel sad again.\n\e[0m")
          gets
          slow_print("\n\e[34mMaybe it's time to leave this room.\n\e[0m")
          gets
          slow_print("\n\e[34m...\n\e[0m")
          gets
          slow_print("\n\e[34m......\n\e[0m")
          gets
          slow_print("\n\e[34m............\n\e[0m")
          gets
          slow_print("\n\e[34mYou feel drawn to the \e[97mwhite door\e[34m...\n\e[0m")
          gets
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "white_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          short_load_animation
          return "white_room"

        end


      else
        slow_print("\n\e[34mThat is not a choice in this moment...\n\e[0m")
    end
  end
end