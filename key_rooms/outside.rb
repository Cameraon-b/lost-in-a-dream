# outside method
def outside
  # This is the ASCII art for the outside area patorjk.com crawford2 font
  clear_screen
  $ascii_outside = [
"    ___  __ __ ______  _________ ___     ___  ",
"   /   \\|  |  |      |/ ___|    |   \\   /  _] ",
"  |     |  |  |      (   \\_ |  ||    \\ /  [_  ",
"  |  O  |  |  |_|  |_|\\__  ||  ||  D  |    _] ",
"  |     |  :  | |  |  /  \\ ||  ||     |   [_  ",
"  |     |     | |  |  \\    ||  ||     |     | ",
"   \\___/ \\__,_| |__|   \\___|____|_____|_____| ",   
"                                              "
]

$ascii_outside.each_with_index do |line, index|
  puts "#{line}"
end

# track the number of times the player has visited this room

visits = increment_visit("outside", $day_or_night)

if $new_game_plus_count >= 1
  slow_print("\nYou get the sense that you've been here before...\n")
  gets
end


# Print the description of the outside area based on the number of visits and the time of day
# visits during day
if $day_or_night == "day"
  case visits
  when 1
    slow_print("\nYou find yourself before a pair of large \e[1;33mgolden doors\e[0m.\n")
    gets
    slow_print("\nYou are outside of a \e[38;5;240mmedieval castle\e[0m, surrounded by \e[38;5;107mflat plains\e[0m.\n")
    gets
    slow_print("\nThere are no other structures or landmarks within sight.\n")
    gets
    slow_print("\nYou are not sure how you got here...\n")
    gets
    slow_print("\nYou take a deep breath...\n")
    gets
    slow_print("\nThen the \e[1;33mgolden doors\e[0m slowly begin to open...\n")
    gets

  when 2
    slow_print("\nYou are in front of the \e[1;33mgolden doors\e[0m.\n")
    gets
    slow_print("\nThey remain open.\n")
    gets
    slow_print("\nYou wonder who made them.\n")
    gets

  else
    slow_print("\nThe \e[1;33mgolden doors\e[0m lie open before you.\n")
    gets
    slow_print("\nThe \e[38;5;240mcastle\e[0m looms above you.\n")
    gets
    slow_print("\nThe \e[38;5;107mflat plains\e[0m surround you.\n")
    gets
  end

# visits during night
elsif $day_or_night == "night"
  case visits

  when 1
    slow_print("\nYou are outside the \e[38;5;240mcastle\e[0m, it is night.\n")
    gets
    slow_print("\nThe sky above is \e[38;5;239mink-black\e[0m, pierced by \e[38;5;189mfaint stars\e[0m that barely illuminate the ground.\n")
    gets
    slow_print("\nA gentle wind whispers through the \e[38;5;107mflat plains\e[0m, cool against your skin.\n")
    gets
    slow_print("\nThe \e[38;5;240mcastle\e[0m behind you looms ominously.\n")
    gets

  when 2
    slow_print("\nYou stand in the \e[1;38;5;250moonlight\e[0m, the \e[38;5;240mcastle\e[0m casting a \e[38;5;239mlong shadow\e[0m behind you.\n")
    gets
    slow_print("\nThe \e[38;5;250mground shimmers slightly\e[0m, dew catching the \e[1;38;5;250mlight\e[0m like scattered glass.\n")
    gets
    slow_print("\nIt's quiet — too quiet. You strain to hear anything, but the silence is absolute.\n")
    gets
    slow_print("\nYour heartbeat feels louder than it should.\n")
    gets

  when 3
    slow_print("\nYou are outside, under the stars.\n")
    gets
    slow_print("\nThe \e[38;5;240mcastle towers silently behind you\e[0m, massive and unmoving.\n")
    gets
    slow_print("\nThe plains stretch in all directions, swallowing sound and thought alike.\n")
    gets
    slow_print("\nYou wonder if you've stepped outside of time.\n")
    gets

  else
    slow_print("\nYou are outside, the \e[38;5;240mcastle\e[0m stands silent and dark behind you.\n")
  end
end


# This loop allows the player to choose actions while outside.
  loop do
    slow_print("\nYou must make a choice: \n1. explore \n2. sleep \n3. eat \n4. stay \n5. menu\n")
    print "> "
    choice = gets.chomp.downcase

    case choice
    when "explore", "1" # This allows the player to explore the outside area.
      $previous_room = $current_room
      $travel_log << { from: $current_room, to: "main_hall", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
      short_load_animation
      return "main_hall"

    when "sleep", "2" # This allows the player to sleep outside.
      return sleep_action("outside")

    when "eat", "3" # This allows the player to eat outside.
      return eat("outside")

    when "leave" # This allows the player to leave the game.
      return leave

    when "menu", "5" # This allows the player to access the main menu.
      return menu_handler

    when "dev_tools", "~" # opens Developer tools menu
        new_room = dev_tools
        return new_room if new_room

    when "stay", "4" # This allows the player to stay which has different outcomes based on how many times they have stayed and the time of day.
      times_stayed = increment_stay("outside", $day_or_night)

      # stays during day
      if $day_or_night == "day"
        case times_stayed
        when 1
          slow_print("\nYou look around...\n")
          gets
          slow_print("\nJust \e[38;5;107mwide open plains\e[0m...")
          gets
          slow_print("\nthe \e[38;5;240mcastle\e[0m distinct against the landscape.\n")
          gets
          slow_print("\n...\n")
          gets
          slow_print("\n\e[38;5;129mIs this a dream?\e[0m\n")
          gets
          slow_print("\n...\n")
          gets
          slow_print("\nYou can hear birds chirping in the distance,\n")
          gets
          slow_print("\nand you feel the breeze on your skin.\n")
          gets

        when 2
          slow_print("\nYou gaze upon the \e[38;5;107mplains\e[0m...\n")
          gets
          slow_print("\nThe vastness is both intimidating and awe-inspiring.\n")
          gets
          slow_print("\nThe best option seems to be going inside the \e[38;5;240mcastle\e[0m.\n")
          gets

        when 3
          slow_print("\nYou become fixated on the \e[38;5;240mcastle\e[0m...\n")
          gets
          slow_print("\nIt looks ancient but it feels outside of time.\n")
          gets
          slow_print("\nYou wonder who built it and why.\n")
          gets
          slow_print("\nYou have a strange sense, like...\n")
          gets
          slow_print("\nLike you might have been here before...\n")
          gets

        else
          slow_print("\nYou look around...\n")
          gets
          slow_print("\nThe \e[38;5;107mplains\e[0m stretch endlessly before you.\n")
          gets
          slow_print("\nThere's nothing for you out here.\n")
          gets
          slow_print("\nYou decide it's time to enter the \e[38;5;240mcastle\e[0m...\n")
          gets
          short_load_animation
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "main_hall", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          return "main_hall"

        end

        # stays during night
      elsif $day_or_night == "night"
        case times_stayed
        when 1
          slow_print("\nYou look up at the \e[38;5;117mstars\e[0m...\n")
          gets
          slow_print("\nThe \e[38;5;239mnight sky\e[0m stretches endlessly above you,\n")
          gets
          slow_print("\nspeckled with \e[38;5;189mconstellations\e[0m you think you remember.\n")
          gets
          slow_print("\nA strange \e[38;5;99mcomfort\e[0m settles in your chest.\n")
          gets


        when 2
          slow_print("\nYou gaze at the \e[38;5;255mmoon\e[0m...\n")
          gets
          slow_print("\nIt casts a \e[38;5;250msilver glow\e[0m over the \e[38;5;240mcastle walls\e[0m,\n")
          gets
          slow_print("\nsoftening their severity, but imbuing a sense of \e[38;5;135mmystery\e[0m.\n")
          gets
          slow_print("\nSomething about the \e[38;5;241mquiet\e[0m feels... too perfect.\n")
          gets


        when 3
          slow_print("\nA breeze stirs the \e[38;5;107mgrass\e[0m around you...\n")
          gets
          slow_print("\nThe \e[38;5;81mchill\e[0m cuts deeper at night.\n")
          gets
          slow_print("\nThe \e[38;5;240mcastle\e[0m looms like a sentinel, still and watching.\n")
          gets
          slow_print("\nYou can't shake the feeling that it's \e[38;5;135mwaiting\e[0m for you.\n")
          gets


        when 4
          slow_print("\nYou close your eyes and breathe in the \e[38;5;109mnight air\e[0m...\n") # 109 = cool violet-blue
          gets
          slow_print("\nIt's calm, almost \e[38;5;225msacred\e[0m, but something lingers.\n")   # 225 = soft glowing pink
          gets
          slow_print("\nYou sense a \e[38;5;51msurge of energy\e[0m starting at your feet.\n")  # 51 = electric blue
          gets
          slow_print("\nYou feel a rush up your spine that forces you to open your eyes.\n")
          gets
          slow_print("\nWith eyes wide open you see a field of \e[38;5;81mblue glowing flowers\e[0m,\n")
          gets
          slow_print("\nWhere there once was a dark field,\n")
          gets
          slow_print("\nis now a \e[38;5;81msea of bioluminescence\e[0m flickering with the breeze.\n") # 120 = soft green glow
          gets
          slow_print("\nAbsolutely \e[38;5;200mmesmerized\e[0m you fall to the ground to get a closer look.\n") # 200 = magenta-pink
          gets
          slow_print("\nThey are reminiscent of \e[38;5;213mstarflowers\e[0m, but glow unlike anything you've seen before.\n")
          gets
          slow_print("\nIt's almost like they have been \e[38;5;171mwaiting\e[0m for you to truly open your eyes...\n") # 171 = mystical rose
          gets
          slow_print("\nYou decide to pull a handful out of the ground.\n")
          gets
          slow_print("\nYou place them in your bag, hoping they will help you on your journey.\n")
          gets
          slow_print("\n*\e[38;5;81mmysterious flowers\e[0m have been added to your bag*.\n") # 117 = cyan shimmer
          gets
          $easter_egg_found[:mysterious_flowers] = true # Mark the mysterious flowers Easter egg as found
          $inventory << "mysterious flowers" # Add mysterious flowers to inventory
          save_game("autosave") # Save game progress to autosave slot

          # over stay sends to main_hall
        else
          slow_print("\nThe \e[38;5;81mblue glowing flowers\e[0m begin to fade in luminosity.\n")
          gets
          slow_print("\nYou feel a sense of loss as their light diminishes.\n")
          gets
          slow_print("\nAs they fade, you feel an emptiness within you...\n")
          gets
          slow_print("\nYou remember you are alone...\n")
          gets
          slow_print("\nPerhaps it's time to go back inside the \e[38;5;240mcastle\e[0m...\n")
          gets
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "main_hall", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          short_load_animation
          return "main_hall"
        end
      end

      # handles unknown input
    else
      slow_print("\nThat is not a choice in this moment...\n")
    end
  end
end