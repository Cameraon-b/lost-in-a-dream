#main_hall method
def main_hall

  $ascii_main_hall = [
  " ___ ___   ____  ____  ____       __ __   ____  _      _     ",
  "|   |   | /    ||    ||    \\     |  |  | /    || |    | |    ",
  "| _   _ ||  o  | |  | |  _  |    |  |  ||  o  || |    | |    ",
  "|  \\_/  ||     | |  | |  |  |    |  _  ||     || |___ | |___ ",
  "|   |   ||  _  | |  | |  |  |    |  |  ||  _  ||     ||     |",
  "|   |   ||  |  | |  | |  |  |    |  |  ||  |  ||     ||     |",
  "|___|___||__|__||____||__|__|    |__|__||__|__||_____||_____|",
  "                                                             "
  ]
  $ascii_main_hall.each_with_index do |line, index|
    puts "#{line}"
  end
  
  # track the number of times the player has visited this room for each day and night
  visits = increment_visit("main_hall", $day_or_night)

  # Print the description of the main hall based on the number of visits and the time of day
  if $day_or_night == "day"
    case visits
    when 1
      slow_print("\nYou enter the \e[1;33mgolden\e[0m doors.\n")
      gets
      slow_print("\nYou find yourself in a large hall.\n")
      gets
      slow_print("\nWith \e[1;97mwhite\e[0m marble walls and a \e[38;5;239mblack\e[0m marble floor.\n")
      gets
      slow_print("\nA \e[38;5;153mglass dome\e[0m above lets the \e[1;38;5;220msunlight\e[0m in.\n")
      gets
      slow_print("\nYou feel a sense of wonder and curiosity.\n")
      gets
      slow_print("\nIt is a very beautiful room.\n")
      gets
      slow_print("\nYou notice there are three arched doorways in front of you.\n")
      gets
      slow_print("\nYou can see the color of the rooms through the archways.\n")
      gets
      slow_print("\nThere is a \e[34mblue\e[0m room,\n")
      gets
      slow_print("\na \e[31mred\e[0m room,\n")
      gets
      slow_print("\nand a \e[38;5;228myellow\e[0m room.\n")
      gets

    when 2
      slow_print("\nYou are in the main hall.\n")
      gets
      slow_print("\nYou notice your footsteps echoing in the hall.\n")
      gets
      slow_print("\nYou shout your name and it echoes back at you.\n")
      gets
      slow_print("\n#{$name}...\n")
      gets
      slow_print("\n#{$name}...\n")
      gets
      slow_print("\n#{$name}...\n")
      gets
      slow_print("\nYou remember you are alone...\n")
      gets

    else
      slow_print("\nYou are in the main hall.\n")
      gets

    end

  elsif $day_or_night == "night"
    case visits
    when 1
      slow_print("\nYou are back in the main hall.\n")
      gets
      slow_print("\nThe atmosphere feels different...\n")
      gets
      slow_print("\nThe \e[38;5;255mmoonlight\e[0m shines through the \e[38;5;153mglass dome\e[0m above you.\n")
      gets
      slow_print("\nBut the hall is much darker at night.\n")
      gets

    when 2
      slow_print("\nYou return to the main hall under the cover of night.\n")
      gets
      slow_print("\nThe \e[38;5;255mmoonlight\e[0m spills across the stone floor like a silent river.\n")
      gets
      slow_print("\n\e[38;5;239mShadows\e[0m stretch long from every corner, curling like tendrils.\n")
      gets
      slow_print("\nIt almost feels like the castle is aware of your presence.\n")
      gets


    else
      slow_print("\nYou find yourself in the main hall once more.\n")
      gets
      slow_print("\nEverything is bathed in a pale glow from the glass dome above.\n")
      gets
      slow_print("\nThe silence is so complete, it's almost humming.\n")
      gets
      slow_print("\nIt feels like the castle is holding its breath.\n")
      gets
    end
  end

  # Loop for player choices in the main hall
  loop do
    slow_print("\nYou must make a choice: \n1. the \e[34mblue\e[0m room \n2. the \e[31mred\e[0m room \n3. the \e[38;5;228myellow\e[0m room \n4. back \n5. stay \n6. menu\n")
    print "> "
    chase = gets.chomp.downcase

    case chase
    when "the blue room", "blue room", "blue", "1" # This allows the player to enter the blue room.
      $previous_room = $current_room
      $travel_log << { from: $current_room, to: "blue_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
      short_load_animation
      return "blue_room"

    when "the red room", "red room", "red", "2" # This allows the player to enter the red room.
      $previous_room = $current_room
      $travel_log << { from: $current_room, to: "red_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
      short_load_animation
      return "red_room"

    when "the yellow room", "yellow room", "yellow", "3" # This allows the player to enter the yellow room.
      $previous_room = $current_room
      $travel_log << { from: $current_room, to: "yellow_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
      short_load_animation
      return "yellow_room"

    when "back", "4" # This allows the player to go back to the previous room.
      slow_print("\nYou step through the \e[1;33mgolden doors\e[0m and go outside.\n")
      gets
      $previous_room = $current_room
      $travel_log << { from: $current_room, to: "outside", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
      short_load_animation
      return "outside"

    when "eat" # This allows the player to eat in the main hall.
      return eat("main_hall")

    when "sleep" # This allows the player to sleep in the main hall.
      return sleep_action("main_hall")

    when "menu", "6"
      menu_handler
        return if $just_loaded_game # If just loaded, return to avoid changing room

    when "dev_tools", "~"
      new_room = dev_tools
      return new_room if new_room

    when "stay", "5"
      times_stayed = increment_stay("main_hall", $day_or_night)

      if $day_or_night == "day"
        case times_stayed # This allows the player to stay with different outcomes based on how many times they have stayed.
        when 1
          slow_print("\nYou take a deep breath...\n")
          gets
          slow_print("\nYou look around at the hall, admiring the design.\n")
          gets
          slow_print("\nWho built this place?\n")
          gets
          slow_print("\n\e[38;5;129mWhere am I?\e[0m\n")
          gets
          slow_print("\n...\n")
          gets

        when 2
          slow_print("\nYou look around the hall again...\n")
          gets
          slow_print("\nThe \e[1;38;5;220msunlight\e[0m coming through the \e[38;5;153mglass dome\e[0m makes the marble sparkle.\n")
          gets
          slow_print("\nYou put your hand on the \e[97mwhite\e[0m marble walls...\n")
          gets
          slow_print("\nYou wonder where such beautiful marble came from.\n")
          gets
          slow_print("\nThe hall is truly inspiring.\n")
          gets

          when 3
          slow_print("\nYou take a moment to reflect...\n")
          gets
          slow_print("\nYou try and remember anything before this moment...\n")
          gets
          slow_print("\nBut it's like trying to hold onto water...\n")
          gets

          else
          slow_print("\nYou look around the hall...\n")
          gets
          slow_print("\nYou don't know why you're here.\n")
          gets
          slow_print("\nBut you know you must find a way forward...\n")
          gets
          slow_print("\nIt's time to move on.\n")
          gets
          connected_rooms = ["red_room", "blue_room", "yellow_room"]
          random_room = connected_rooms.sample
          pretty = random_room.tr('_', ' ')
          slow_print("\nYou are drawn to the #{pretty}.\n")
          gets
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: random_room, time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          short_load_animation
          return random_room

        end

      elsif $day_or_night == "night"
      case times_stayed # This allows the player to stay with different outcomes based on how many times they have stayed.
        when 1
          slow_print("\nYou sit quietly in the center of the hall...\n")
          gets
          slow_print("\nThe \e[38;5;255mmoonlight\e[0m filters through the glass dome like \e[38;5;255mliquid silver\e[0m.\n")
          gets
          slow_print("\nIt paints ghostly shapes across the floor.\n")
          gets
          slow_print("\nFor a moment, you feel like you're inside a dream.\n")
          gets

        when 2
          slow_print("\nYou linger in the stillness...\n")
          gets
          slow_print("\n\e[38;5;239mShadows\e[0m crawl up the walls, flickering as if they have life of their own.\n")
          gets
          slow_print("\nThe silence is not empty, it's full of energy.\n")
          gets
          slow_print("\nYou sense the presence of something ancient here.\n")
          gets

        when 3
          slow_print("\nYour eyelids grow heavy...\n")
          gets
          slow_print("\nYou lie back on the marble floor, gazing up at the dome.\n")
          gets
          slow_print("\n\e[38;5;189mconstellations\e[0m shift subtly, unknown yet deeply familiar.\n")
          gets
          slow_print("\nYou remember a face, and feel affection, but it slips away.\n")
          gets

        else
          slow_print("\nThe longer you stay, the stranger the hall feels...\n")
          gets
          slow_print("\nThe \e[38;5;255mlight\e[0m seems thinner, the \e[38;5;239mshadows\e[0m deeper.\n")
          gets
          slow_print("\nYour thoughts begin to drift in odd directions.\n")
          gets
          slow_print("\nPerhaps it's time to go.\n")
          gets
          
          connected_rooms = ["red_room", "blue_room", "yellow_room"]
          random_room = connected_rooms.sample
          slow_print("\nYou feel drawn to the #{random_room}.\n")
          gets
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: random_room, time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          short_load_animation
          return random_room

        end
      end
    else
      slow_print("\nThat is not a choice in this moment...\n")
    end
  end
end