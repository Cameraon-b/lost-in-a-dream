# 5th room in the left path
# This method represents the attic in the game.
def attic
  $ascii_attic = [
  " ____  ______  ______  ____   __                                       ",
  "/    ||      ||      ||    | /  ]                                      ",
  "|  o  ||      ||      | |  | /  /                                      ",
  "|     ||_|  |_||_|  |_| |  |/  /                                       ",
  "|  _  |  |  |    |  |   |  /   \\_                                     ",
  "|  |  |  |  |    |  |   |  \\     |                                    ",
  "|__|__|  |__|    |__|  |____\\____|                                    ",
  "                                                                       "
  ]
  $ascii_attic.each_with_index do |line, index|
    puts "\e[1;38;5;244m#{line}\e[0m"
  end

  $visited_rooms["attic"] += 1
  visits = $visited_rooms["attic"]

  case visits
  when 1
    slow_print("\n\e[38;5;244mYou find yourself in a dusty attic.\n\e[0m")
    gets
    slow_print("\n\e[38;5;244mThe walls are made of old wooden beams, and the floor is creaky.\n\e[0m")
    gets
    slow_print("\n\e[38;5;244mThere are cobwebs in the corners, and dust everywhere.\n\e[0m")
    gets
    slow_print("\n\e[38;5;244mYou feel a sense of nostalgia and mystery in this room.\n\e[0m")
    gets
    slow_print("\n\e[38;5;244mYou notice a door on the opposite side of the room.\n\e[0m")
    gets
    slow_print("\n\e[38;5;244mIt is a sparkling \e[38;5;159mdiamond door\e[38;5;244m, with an ornate cut \e[38;5;159mdiamond doorknob\e[38;5;244m.\n\e[0m")
    gets
    slow_print("\n\e[38;5;244mThere is a small circular notch in the middle of the door.\n\e[0m")
    gets
    slow_print("\n\e[38;5;244mThe center of which is \e[1;33mgolden\e[38;5;244m.\n\e[0m")
    gets
    slow_print("\n\e[38;5;244mYou feel like this door is special, like it holds secrets.\n\e[0m")
    gets
    slow_print("\n\e[38;5;244mYou struggle to look away...\n\e[0m")
    gets

  when 2
    slow_print("\n\e[38;5;244mYou find yourself in the attic.\n\e[0m")
    gets

  else
    slow_print("\n\e[38;5;244mYou are in the attic.\n\e[0m")
    gets
  end

  #loop for player choices in the attic
  loop do
    slow_print("\n\e[38;5;244mYou must make a choice: \n1. explore \n2. back \n3. eat \n4. sleep\n5. stay \n6. menu\n\e[0m")
    print "> "
    choice = gets.chomp.downcase

      case choice

      when "explore", "1"

        # Check if the diamond room door is unlocked
        if $doors_unlocked["diamond_room"]
          slow_print("\n\e[38;5;244mYou step up to the \e[38;5;159mdiamond door\e[38;5;244m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mYou push on the door and it opens easily.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mYou descend the stairs into the diamond room.\n\e[0m")
          gets
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "diamond_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          short_load_animation
          return "diamond_room"

        # If the door is locked, prompt the player for the key, unlock if player has it
        elsif $inventory.include?("gold ring")
          slow_print("\n\e[38;5;244mYou step up to the \e[38;5;159mdiamond door\e[38;5;244m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mYou run your hand along the surface of the door.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mIt is incredibly smooth, and feels cool to the touch.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mYou focus in on the small circular notch in the center of the door.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mIt is the same size as the \e[1;33mgold ring\e[38;5;244m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mYou take the \e[1;33mgold ring\e[38;5;244m from your pocket and place it in the notch.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244m*\e[1;33mgold ring\e[38;5;244m has been removed from your bag*\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mThe ring fits perfectly, and the door clicks open.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mYou step through the doorway to find a set of stairs.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mYou decide to descend the stairs.\n\e[0m")
          gets
          $doors_unlocked["diamond_room"] = true
          $inventory.delete("gold ring") # Remove the ring after use
          save_game("autosave") # Autosave after unlocking the door
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "diamond_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          short_load_animation
          return "diamond_room"

          # player has not unlocked the door
        else
          slow_print("\n\e[38;5;244mYou step up to the \e[38;5;159mdiamond door\e[38;5;244m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mYou try the doorknob but the door won't budge.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mYou focus on the notch in the middle of the door.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mThe center is \e[1;33mgolden\e[38;5;244m...\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mIt seems like something is supposed to go here...\n\e[0m")
          gets
      end

      # Go back to the previous room
      when "back", "2"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "library", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "library"

      # Eat action
      when "eat", "3"
        return eat("attic")

      # Sleep action
      when "sleep", "4"
        return sleep_action("attic")

      # Menu action
      when "menu", "6"
        menu_handler
        return if $just_loaded_game # If just loaded, return to avoid changing room

      # Developer tools
      when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room

      # Stay action
      when "stay", "5"
        #tracks number of times stay was a choice in the attic
        $stay_counts["attic"] += 1
        times_stayed = $stay_counts["attic"]

        case times_stayed
        when 1
          slow_print("\n\e[38;5;244mYou take a deep breath...\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mDust dances in the faint \e[1;38;5;220msunlight\e[38;5;244m filtering through cracks in the roof.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mYou spot a stack of old suitcases, each with fading initials.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mOne is slightly open... woman's clothing peeks out.\n\e[0m")
          gets


        when 2
          slow_print("\n\e[38;5;244mYou kneel beside an antique rocking chair.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mIts fabric is torn, but the wood is smooth with age.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mIt rocks gently on its own for a moment, creaking like a sigh.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mA melody you don't recognize hums at the edge of your mind...\n\e[0m")
          gets


          # Sends player back to library, or diamond room if unlocked
        else
          slow_print("\n\e[38;5;244mYou brush cobwebs off an old grandfather clock.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mIts hands spin wildly before both stopping at 12.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mYou see a faded photograph on the wall. A large family portrait, but the faces are scratched out.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mFor a moment, you consider that this might be your family.\n\e[0m")
          gets
          slow_print("\n\e[38;5;244m...\n\e[0m")
          gets
          slow_print("\n\e[38;5;244m......\n\e[0m")
          gets
          slow_print("\n\e[38;5;244m............\n\e[0m")
          gets
          slow_print("\n\e[38;5;244mYou think it's time to leave the attic.\n\e[0m")
          gets

          short_load_animation
          $previous_room = $current_room
          destination = $doors_unlocked["diamond_room"] ? "diamond_room" : "library"
          $travel_log << { from: $current_room, to: destination, time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          return destination
        end

      else
      slow_print("\n\e[38;5;244mThat is not a choice in this moment...\n\e[0m")
    end
  end
end