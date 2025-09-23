# outside_end method
def outside_end
  # track the number of times the player has visited this room
  $visited_rooms["outside"] += 1
  visits = $visited_rooms["outside"]

  #  require 'artii'
  # puts "\n"
  # a = Artii::Base.new(font: 'smshadow')
  # puts "\n"
  # puts a.asciify('OUTSIDE')
  # gets

    $ascii_outside_end = [
"    ___  __ __ ______  _________ ___     ___  ",
"   /   \\|  |  |      |/ ___|    |   \\   /  _] ",
"  |     |  |  |      (   \\_ |  ||    \\ /  [_  ",
"  |  O  |  |  |_|  |_|\\__  ||  ||  D  |    _] ",
"  |     |  :  | |  |  /  \\ ||  ||     |   [_  ",
"  |     |     | |  |  \\    ||  ||     |     | ",
"   \\___/ \\__,_| |__|   \\___|____|_____|_____| ",   
"                                              "
]
      $ascii_outside_end.each_with_index do |line, index|
        puts "#{line}"
      end

  # Print the description of the outside area based on the number of visits and the time of day
if $day_or_night == "day"
  case visits
  when 1
    slow_print("\nIf you are reading this then you are either using dev commands or you broke the game!\n")
    gets
  end

elsif $day_or_night == "night"
  case visits

  when 1
    slow_print("\nYou find yourself outside the castle at night.\n")
    gets
    
  when 2
    slow_print("\nYou find yourself outside in the cool night air.\n")
    gets
    slow_print("\nYou can see the stars twinkling in the sky above you.\n")
    gets
    slow_print("\nThe moon is full and bright, casting a silver glow on the plains.\n")
    gets
    slow_print("\nYou feel a sense of calm and peace.\n")
    gets

  when 3
    slow_print("\nYou step outside the castle.\n")
    gets
    slow_print("\nThe night is quiet, the sky is dark.\n")
    gets
    slow_print("\nYou look into the distance.\n")
    gets
    slow_print("\nIt's like staring into the void.\n")
    gets

  when 4
    slow_print("\nYou step outside the castle.\n")
    gets
    slow_print("\nThe night is quiet, the sky is dark.\n")
    gets
    slow_print("\nYou look into the distance.\n")
    gets
    slow_print("\nIt's like staring into the void.\n")
    gets

  else
    slow_print("\nYou step outside the castle.\n")
    gets
    slow_print("\nThe night is quiet, the sky is dark.\n")
    gets
    slow_print("\nYou look into the distance.\n")
    gets
    slow_print("\nIt's like staring into the void.\n")
    gets

  end
end


# This loop allows the player to choose actions while outside.
  loop do
    slow_print("\nYou must make a choice: \n1. explore \n2. wake up\n")
    print "> "
    choice = gets.chomp.downcase

    case choice

    when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room

    when "menu"
      menu_handler
      return if $just_loaded_game # If just loaded, return to avoid changing room

    when "explore", "1" # This allows the player to explore the outside area.
      $explore_count["outside_end"] += 1
      times_explored = $explore_count["outside_end"]

      case times_explored
      when 1
        slow_print("\nThe large \e[1;33mgolden\e[0m doors are sealed tight...\n")
        gets
        slow_print("\nYou can see no way to open them from this side.\n")
        gets
        slow_print("\nYou take a deep breath...\n")
        gets
        slow_print("\nBut nothing happens.\n")
        gets

      when 2
        slow_print("\nYou turn around and gaze into the dark plains...\n")
        gets
        slow_print("\nYou see no light sources anywhere in the distance.\n")
        gets
        slow_print("\nJust the stars glimmering above you, \n")
        gets
        slow_print("\nand the moonlight gently illuminating the ground.\n")
        gets

      when 3
        slow_print("\nYou look around...\n")
        gets
        slow_print("\nYou decide to just start walking into the darkness...\n")
        gets
        slow_print("\nYou feel the cool breeze on your skin...\n")
        gets
        slow_print("\nYour mind becomes clear...\n")
        gets
        slow_print("\nYou no longer feel your body...\n")
        gets
        slow_print("\nYour senses begin to fade...\n")
        gets
        slow_print("\n...\n")
        gets
        slow_print("\n......\n")
        gets
        slow_print("\n............\n")
        gets
        return end_credits
      
      end

    when "wake up", "2"
      return wake_up

    else
      slow_print("\nThat is not a choice in this moment...\n")
    end
  end
end