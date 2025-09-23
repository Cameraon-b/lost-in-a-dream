#4th room in the right path
# This method represents the baths in the game.
def baths
  $ascii_baths = [
    " ____    ____  ______  __ __  _____",
    "|    \\  /    ||      ||  |  |/ ___/",
    "|  o  )|  o  ||      ||  |  (   \\_ ",
    "|     ||     ||_|  |_||  _  |\\__  |",
    "|  O  ||  _  |  |  |  |  |  |/  \\ |",
    "|     ||  |  |  |  |  |  |  |\\    |",
    "|_____||__|__|  |__|  |__|__| \\___|"
  ]
  $ascii_baths.each_with_index do |line, index|
    puts "\e[38;5;117m#{line}\e[0m"
  end

  visits = increment_visit("baths", $day_or_night)
  # Check if it's day or night and times visited and print the appropriate description
if $day_or_night == "day"

  case visits
  when 1
    slow_print("\n\e[38;5;117mYou find yourself in a communal bathing area.\n\e[0m")
    gets
    slow_print("\n\e[38;5;117mThe walls and floor are lined with small, smooth, light blue tiles..\n\e[0m")
    gets
    slow_print("\n\e[38;5;117mThe ceiling is a vaulted \e[38;5;94mwooden structure\e[38;5;117m, with \e[38;5;94mexposed\e[38;5;117m beams.\n\e[0m")
    gets
    slow_print("\n\e[38;5;117mThere is a large \e[38;5;246mstone bathtub\e[38;5;117m in the center of the room.\n\e[0m")
    gets
    slow_print("\n\e[38;5;117mIt is filled with warm water, steam rising from the surface.\n\e[0m")
    gets
    slow_print("\n\e[38;5;117mThe bath seems to be calling out to you, or maybe it is just your desire.\n\e[0m")
    gets
    slow_print("\n\e[38;5;117mThere are \e[38;5;246mthree smaller baths\e[38;5;117m around the room, all three are empty.\n\e[0m")
    gets
    slow_print("\n\e[38;5;117mThe air is warm and humid, and you can smell the faint scent of \e[38;5;137msandalwood\e[38;5;117m.\n\e[0m")
    gets
    slow_print("\n\e[38;5;117mThere is a small table with a few towels and a bar of soap on it.\n\e[0m")
    gets
    slow_print("\n\e[38;5;117mThis room is cozy and inviting, almost as if the full bath \e[38;5;201mwelcomes you\e[0m\n\e[0m")
    gets
    slow_print("\n\e[38;5;117mThere is a door on the opposite side of the room.\n\e[0m")
    gets
    slow_print("\n\e[38;5;117mIt is a \e[38;5;94mwooden door\e[38;5;117m with a small circular window near the top.\n\e[0m")
    gets
    slow_print("\n\e[38;5;117mYou can see \e[1;38;5;220msunlight\e[38;5;117m beaming through the window.\n\e[0m")
    gets

  when 2
    slow_print("\n\e[38;5;117mYou find yourself in the baths again.\n\e[0m")
    gets

  else
    slow_print("\n\e[38;5;117mYou are back in the baths.\n\e[0m")
    gets
  end

else #night
  case visits
  when 1
    slow_print("\n\e[38;5;117mYou step into the baths under the cover of night.\n\e[0m")
    gets
    slow_print("\n\e[38;5;117mThe blue tiles glisten faintly in the \e[38;5;255mpale moonlight\e[38;5;117m filtering through high windows.\n\e[0m")
    gets
    slow_print("\n\e[38;5;117mThe water in the great stone tub is dark, its surface shifting like liquid glass.\n\e[0m")
    gets
    slow_print("\n\e[38;5;117mThe air feels cooler than it did by day, and the scent of \e[38;5;137msandalwood\e[38;5;117m clings faintly to the mist.\n\e[0m")
    gets

  when 2
    slow_print("\n\e[38;5;117mYou find yourself in the baths once more, their silence heavy at night.\n\e[0m")
    gets
    slow_print("\n\e[38;5;117mThe vaulted ceiling is swallowed in shadow, beams vanishing into darkness.\n\e[0m")
    gets
    slow_print("\n\e[38;5;117mRipples spread across the central tub as if something had just disturbed it...\n\e[0m")
    gets

  else
    slow_print("\n\e[38;5;117mYou are in the baths.\n\e[0m")
    gets
  end
end

  loop do
    slow_print("\n\e[38;5;117mYou must make a choice: \n1. explore\n2. back\n3. eat\n4. sleep \n5. stay \n6. bathe \n7. menu\n\e[0m")
    print "> "
    choice = gets.chomp.downcase

      case choice
      when "bathe", "6"
       $bathe_count["baths"] += 1
      bathe = $bathe_count["baths"]

      case bathe
        when 1
          slow_print("\n\e[38;5;117mYou take off your clothes and drop them on the tile floor.\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mYou step into the warm water...\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mYou feel the heat of the water on your skin...\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mYou close your eyes and let yourself relax...\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mYou sit quietly, enjoying the warmth of the water.\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mYour mind is clear...\n\e[0m")
          gets
          slow_print("\n\e[38;5;117m...\n\e[0m")
          gets
          slow_print("\n\e[38;5;117m......\n\e[0m")
          gets
          slow_print("\n\e[38;5;117m............\n\e[0m")
          gets
          
        when 2
          slow_print("\n\e[38;5;117mYou step into the warm water again...\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mIt feels just as warm as before...\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mYou wonder who filled the tub.\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mYou wonder what heats it.\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mSomeone must take care of this castle.\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mBut where could they be?\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mAm I intruding in this place?\n\e[0m")
          gets

        when 3
          slow_print("\n\e[38;5;117mYou step into the warm water again...\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mIt just feels so good...\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mYou've done a lot of walking today.\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mYour feet are happy right now.\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mYou relax completely.\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mBut then you start to feel uneasy for some reason.\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mMaybe it is just your mind...\n\e[0m")
          gets

        when 4
          slow_print("\n\e[38;5;117mYou decide to get in the tub once again...\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mBut quickly you feel like you have overstayed your welcome...\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mYou can feel the water becoming cooler...\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mThe bath is starting to feel too small...\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mYou decide to get out of the tub.\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mAs you are getting out,\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mYou notice something shiny inside one of the smaller baths.\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mYou walk over to find a \e[38;5;250msilver necklace\e[38;5;117m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mYou realize that someone was here recently.\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mYou decide to put the necklace in your bag.\n\e[0m")
          gets
          $inventory << "silver necklace"
          $easter_egg_found[:silver_necklace] = true # Set the silver necklace flag to true
          slow_print("\n\e[38;5;117m*\e[38;5;250msilver necklace\e[38;5;117m has been added to your bag*\e[0m\n")
          gets
          save_game("autosave") # Autosave after finding the silver necklace

        else
          slow_print("\n\e[38;5;117mThe water is cold and cloudy, you don't want to get in anymore.\n\e[0m")
          gets

        $last_bathe_visit["baths"] = visits


        end


      when "explore", "1"
        if $last_bathe_visit["baths"] == visits
          slow_print("\n\e[38;5;117mYou pick up your clothes and get dressed.\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mYou step up to the \e[38;5;94mwooden door\e[38;5;117m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mYou open the door and step outside.\n\e[0m")
          gets

        else
          slow_print("\n\e[38;5;117mYou step up to the \e[38;5;94mwooden door\e[38;5;117m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;117mYou open the door and step outside.\n\e[0m")
          gets
        end

        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "courtyard", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "courtyard"

      when "back", "2"
         $previous_room = $current_room
        $travel_log << { from: $current_room, to: "pink_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "pink_room"

      when "eat", "3"
        return eat("baths")

      when "sleep", "4"
        return sleep_action("baths")

        when "menu", "7"
        menu_handler
        return if $just_loaded_game # If just loaded, return to avoid changing room

      when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room

      when "stay", "5"
        times_stayed = increment_stay("baths", $day_or_night)
        bathed = $bathe_count["baths"] || 0

        if $day_or_night == "night"
          # ---- NIGHT BRANCH ----
          case times_stayed
          when 1
            slow_print("\n\e[38;5;117mYou sit quietly in the shadowed baths.\n\e[0m")
            gets
            slow_print("\n\e[38;5;255Moonlight\e[38;5;117m trickles faintly across the tiles, but the water reflects nothing back.\n\e[0m")
            gets

          when 2
            slow_print("\n\e[38;5;117mThe air feels heavier now, thick with damp silence.\n\e[0m")
            gets
            slow_print("\n\e[38;5;117mEvery droplet from the ceiling echoes like a hollow heartbeat.\n\e[0m")
            gets

          when 3
            slow_print("\n\e[38;5;117mA ripple stirs in the tub, though you never touched the water.\n\e[0m")
            gets
            slow_print("\n\e[38;5;117mYour reflection bends unnaturally in the surface, twisting away from you.\n\e[0m")
            gets

          else
            slow_print("\n\e[38;5;117mThe baths grow restless—the silence sharpens into pressure.\n\e[0m")
            gets
            slow_print("\n\e[38;5;117mA chill wind stirs from nowhere, urging you out.\n\e[0m")
            gets
            short_load_animation
            $previous_room = $current_room
            $travel_log << { from: $current_room, to: "pink_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
            return "pink_room"
          end

        elsif bathed > 2
          # ---- ANGRY BATHS BRANCH (player stays OUTSIDE the water) ----
          case times_stayed
          when 1
            slow_print("\n\e[38;5;117mYou sit on the cool tile, avoiding the bath.\n\e[0m")
            gets
            slow_print("\n\e[38;5;117mThe water lies flat and gray, indifferent to your presence.\n\e[0m")
            gets
          when 2
            slow_print("\n\e[38;5;117mA ribbon of chill rolls across the surface.\n\e[0m")
            gets
            slow_print("\n\e[38;5;117mThe faint \e[38;5;137msandalwood\e[38;5;117m is gone, replaced by wet stone and stubborn silence.\n\e[0m")
            gets
          when 3
            slow_print("\n\e[38;5;117mYou stare into the water. Tiny ripples gather, as if the bath is breathing shallowly.\n\e[0m")
            gets
            slow_print("\n\e[38;5;117mYou see your reflection flicker with each ripple.\n\e[0m")
            gets
          when 4
            slow_print("\n\e[38;5;117mCondensation beads on the wood above, ticking down like tapping fingers.\n\e[0m")
            gets
            slow_print("\n\e[38;5;117mYou can hear old pipes groan beneath the floor.\n\e[0m")
            gets
          else
            slow_print("\n\e[38;5;117mThe whole room begins to get colder.\n\e[0m")
            gets
            slow_print("\n\e[38;5;117mYou understand, you've overstayed. It wants you gone.\n\e[0m")
            gets
            short_load_animation
            $previous_room = $current_room
            $travel_log << { from: $current_room, to: "courtyard", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
            return "courtyard"
          end

        else
          # ---- NORMAL BRANCH (daytime, not overused) ----
          case times_stayed
          when 1
            slow_print("\n\e[38;5;117mYou sit down on the edge of the bathtub...\n\e[0m")
            gets
            slow_print("\n\e[38;5;117mThe steam rises slowly, curling in the warm air.\n\e[0m")
            gets
            slow_print("\n\e[38;5;117mFor a moment, the whole world feels far away.\n\e[0m")
            gets
          when 2
            slow_print("\n\e[38;5;117mYou lean back against the smooth tile wall...\n\e[0m")
            gets
            slow_print("\n\e[38;5;117mRipples shift gently as if stirred by unseen hands.\n\e[0m")
            gets
            slow_print("\n\e[38;5;117mWater dripping echoes softly from somewhere in the room.\n\e[0m")
            gets
          when 3
            slow_print("\n\e[38;5;117mYou close your eyes, letting the warmth wrap around you like a blanket...\n\e[0m")
            gets
            slow_print("\n\e[38;5;117mYou open your eyes; nothing has changed, and yet you feel lighter.\n\e[0m")
            gets
          when 4
            slow_print("\n\e[38;5;117mYou've lingered long enough. Should you get in... or leave?\n\e[0m")
            gets
          else
            slow_print("\n\e[38;5;117mIt feels like time to move on.\n\e[0m")
            gets
            short_load_animation
            $previous_room = $current_room
            $travel_log << { from: $current_room, to: "courtyard", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
            return "courtyard"
          end
        end


      else
        slow_print("\n\e[38;5;117mThat is not a choice in this moment...\n\e[0m")
    end
  end
end