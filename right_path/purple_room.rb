#2nd room in the middle path
#purple room method
def purple_room
  $ascii_purple_room = [
    " ____  __ __  ____   ____  _        ___      ____   ___    ___   ___ ___           ",
    "|    \\|  |  ||    \\ |    \\| |      /  _]    |    \\ /   \\  /   \\ |   |   |          ",
    "|  o  )  |  ||  D  )|  o  ) |     /  [_     |  D  )     ||     || _   _ |          ",
    "|   _/|  |  ||    / |   _/| |___ |    _]    |    /|  O  ||  O  ||  \\_/  |          ",
    "|  |  |  :  ||    \\ |  |  |     ||   [_     |    \\|     ||     ||   |   |          ",
    "|  |  |     ||  .  \\|  |  |     ||     |    |  .  \\     ||     ||   |   |          ",
    "|__|   \\__,_||__|\\_||__|  |_____||_____|    |__|\\_|\\___/  \\___/ |___|___|          ",
  ]
  $ascii_purple_room.each_with_index do |line, index|
    puts "\e[38;5;129m#{line}\e[0m"
  end

  $visited_rooms["purple_room"] += 1
  visits = $visited_rooms["purple_room"]

  case visits
  when 1
    slow_print("\n\e[38;5;129mYou find yourself in a room of purple.\n\e[0m")
    gets
    slow_print("\n\e[38;5;129mThis room radiates confidence and grandeur...\n\e[0m")
    gets
    slow_print("\n\e[38;5;129mThe walls are covered in purple felt, there is a shine to them.\n\e[0m")
    gets
    slow_print("\n\e[38;5;129mThe floor is made of tiles of alternating \e[38;5;239mblack\e[38;5;129m and purple.\n\e[0m")
    gets
    slow_print("\n\e[38;5;129mYou run your hands along the walls, feeling the texture of the purple felt.\n\e[0m")
    gets
    slow_print("\n\e[38;5;129mYou feel like you should stay in this room awhile.\n\e[0m")
    gets
    slow_print("\n\e[38;5;129mYou notice a door on the opposite side of the room.\n\e[0m")
    gets
    slow_print("\n\e[38;5;129mA seductive, \e[38;5;198mhot pink\e[38;5;129m door.\n\e[0m")
    gets
    slow_print("\n\e[38;5;129mYou feel an attraction toward it.\n\e[0m")
    gets

  when 2
    slow_print("\n\e[38;5;129mYou are in the purple room.\n\e[0m")
    gets

  else
    slow_print("\n\e[38;5;129mYou are in the purple room.\n\e[0m")
    gets
  end

  loop do
    slow_print("\n\e[38;5;129mYou must make a choice: \n1. explore\n2. back\n3. eat\n4. sleep\n5. stay \n6. menu\n\e[0m")
    print "> "
    choice = gets.chomp.downcase

      case choice

      when "explore", "1"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "pink_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "pink_room"

      when "back", "2"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "yellow_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "yellow_room"

      when "eat", "3"
        return eat("purple_room")

      when "sleep", "4"
        return sleep_action("purple_room")

      when "menu", "6"
        menu_handler
        return if $just_loaded_game # If just loaded, return to avoid changing room

      when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room

      when "stay", "5"
        $stay_counts["purple_room"] += 1
        times_stayed = $stay_counts["purple_room"]

        case times_stayed

        when 1
          slow_print("\n\e[38;5;129mYou sit down on a purple velvet couch.\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mThere are three purple couches in this room.\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mWith end tables on either side of the couches.\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mAbstract sculptures adorn the tables.\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mIn the middle of the room, \n\e[0m")
          gets
          slow_print("\n\e[38;5;129mthere is a large purple table.\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mYou feel like you should sit on each couch.\n\e[0m")
          gets

        when 2
          slow_print("\n\e[38;5;129mYou sit down on another of the purple couches...\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mYou close your eyes...\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mYou hear a voice whisper,\n\e[0m")
          gets
          slow_print("\n\e[38;5;129m'#{ $name }'\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mYou open your eyes wide and look around, but you are alone.\n\e[0m")
          gets
          slow_print("\n\e[38;5;129m...\n\e[0m")
          gets

        when 3
          slow_print("\n\e[38;5;129mYou quickly move to the third purple couch.\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mEven though they all look the same,\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mYou think this one is most comfortable.\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mYou close your eyes and take a deep breath...\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mThen you hear a clang on the purple table.\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mYou open your eyes and see a \e[1;33mgold ring\e[38;5;129m on the table.\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mYou walk to the purple table\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mYou pick up the \e[1;33mgold ring\e[38;5;129m and feel its weight.\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mYou decide to put the \e[1;33mgold ring\e[38;5;129m in your bag.\n\e[0m")
          gets
          slow_print("\n\e[38;5;129m*\e[1;33mgold ring\e[38;5;129m has been added to your bag.*\n\e[0m")
          gets
          $inventory << "gold ring"
          save_game("autosave")
      

        else
          slow_print("\n\e[38;5;129mYou go to sit on a purple couch again...\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mBut you just can't get comfortable.\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mYou move to another purple couch, but it feels just as uncomfortable.\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mYou hop to the third purple couch, but it is now the most uncomfortable.\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mIt seems the purple couches have conspired against you...\n\e[0m")
          gets
          slow_print("\n\e[38;5;129mYou feel it's time to leave the purple room.\n\e[0m")
          gets
          short_load_animation
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "pink_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          return "pink_room"

        end

      else
      slow_print("\n\e[38;5;129mThat is not a choice in this moment...\n\e[0m")
    end
  end
end