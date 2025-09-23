#observatory method (room)
def observatory(from_room = $current_room)
  # Check if the gems have been inserted
  
  unless $gems_inserted.values.all?
    slow_print("\n\e[38;5;183mThe door to the observatory is sealed. Three gems must be inserted first.\n\e[0m")
    gets
    clear_screen
    return $previous_room
  end

  $current_room = "observatory"

  short_load_animation

  $day_or_night = "night" # Set the time of day to night

def print_ascii_with_gradient(ascii_lines, gradient_colors = [60, 99, 141])
  ascii_lines.each_with_index do |line, index|
    color = gradient_colors[index % gradient_colors.length]
    puts "\e[1;38;5;#{color}m#{line}\e[0m"
  end
end

  $ascii_observatory = [
"  ___   ____    _____   ___  ____  __ __   ____  ______   ___   ____   __ __  ",
" /   \\ |    \\  / ___/  /  _]|    \\|  |  | /    ||      | /   \\ |    \\ |  |  | ",
"|     ||  o  )(   \\_  /  [_ |  D  )  |  ||  o  ||      ||     ||  D  )|  |  | ",
"|  O  ||     | \\__  ||    _]|    /|  |  ||     ||_|  |_||  O  ||    / |  ~  | ",
"|     ||  O  | /  \\ ||   [_ |    \\|  :  ||  _  |  |  |  |     ||    \\ |___, | ",
"|     ||     | \\    ||     ||  .  \\\\   / |  |  |  |  |  |     ||  .  \\|     | ",
" \\___/ |_____|  \\___||_____||__|\\_| \\_/  |__|__|  |__|   \\___/ |__|\\_||____/  ",
"                                                                              "
  ]
  print_ascii_with_gradient($ascii_observatory)

  $just_loaded = false

  $visited_rooms["observatory"] += 1
  visits = $visited_rooms["observatory"]

  # Print the description of the observatory based on the number of visits
  case visits
  when 1
    slow_print("\n\e[38;5;183mYou find yourself in a room with a \e[38;5;220mgiant telescope\e[38;5;183m.\n\e[0m")
    gets
    slow_print("\n\e[38;5;183mThe floor is a checkerboard pattern of \e[38;5;16mblack\e[38;5;183m and \e[38;5;231mwhite\e[38;5;183m tiles,\n\e[0m")
    gets
    slow_print("\n\e[38;5;183mThe walls are lined with bookshelves,\n\e[0m")
    gets
    slow_print("\n\e[38;5;183mfilled with books about the stars and planets.\n\e[0m")
    gets
    slow_print("\n\e[38;5;183mThe ceiling is a massive \e[38;5;153mglass dome\e[38;5;183m.\n\e[0m")
    gets
    slow_print("\n\e[38;5;183mYou realize it is night outside now.\n\e[0m")
    gets
    slow_print("\n\e[38;5;183mThe moon shines bright overhead.\n\e[0m")
    gets
    slow_print("\n\e[38;5;183mThe moonlight bathes the room in a soft glow.\n\e[0m")
    gets
    slow_print("\n\e[38;5;183mThere is an ornate daybed on one side of the room.\n\e[0m")
    gets
    slow_print("\n\e[38;5;183mMade of \e[38;5;94mdark wood\e[38;5;183m, and a \e[38;5;62mroyal blue cushion\e[38;5;183m, it looks soft and inviting.\n\e[0m")
    gets
    slow_print("\n\e[38;5;183mThere is an \e[38;5;180mantique wooden desk\e[38;5;183m on the other end of the room.\n\e[0m")
    gets
    slow_print("\n\e[38;5;183mIt is covered in papers and writing utensils,\n\e[0m")
    gets
    slow_print("\n\e[38;5;183ma \e[38;5;135mmysterious book\e[38;5;183m bound in dark leather that appears to be in an alien language,\n\e[0m")
    gets
    slow_print("\n\e[38;5;183mand a \e[38;5;123mstrange device\e[38;5;183m with glowing symbols.\n\e[0m")
    gets
    slow_print("\n\e[38;5;183mThere is an electric energy in the air.\n\e[0m")
    gets
    slow_print("\n\e[38;5;183mThere is a single drawer on each side of the desk.\n\e[0m")
    gets

  when 2
    slow_print("\n\e[38;5;183mYou find yourself in the observatory again.\n\e[0m")
    gets

  else
    slow_print("\n\e[38;5;183mYou are in the observatory.\n\e[0m")
    gets
  end

  loop do
    choices = <<~CHOICES
      \n\e[38;5;183mYou must make a choice:
      1. stay
      2. back
      3. eat
      4. sleep
      5. view desk
      6. view telescope
      7. menu\e[0m
    CHOICES

    choices += "\e[38;5;201m8. begin ritual\e[0m\n" if $sigil_appeared && $ritual_items_collected && $ritual_ready

    slow_print(choices)



    # slow_print("\n\e[38;5;183mYou must make a choice: \n1. stay\n2. back\n3. eat\n4. sleep \n5. menu \n6. view telescope \n7. view desk\e[0m")

    # if $sigil_appeared && $ritual_items_collected && $ritual_ready
    #   slow_print("\e[38;5;201m8. begin ritual\e[0m")
    # end

    print "> "
    choice = gets.chomp.downcase

      case choice

      when "back", "2"
        # Pick a random room from the gem rooms
        gem_rooms = ["diamond_room", "emerald_room", "ruby_room"]

        # Randomly select one
        destination = gem_rooms.sample

        # Track travel in log
        $travel_log << { from: $current_room, to: destination, time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }

        # Save the observatory as the previous room
        $previous_room = $current_room

        short_load_animation
        return destination

      when "eat", "3"
        return eat("observatory")

      when "sleep", "4"
        return sleep_observatory("observatory")

      when "menu", "7"
        menu_handler
        return if $just_loaded_game # If just loaded, return to avoid changing room

      when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room
        return "observatory" # Return to observatory if no new room

      when "view telescope", "6"
        $view_telescope["observatory"] += 1
        view_times = $view_telescope["observatory"]

        case view_times
          when 1
          slow_print("\n\e[38;5;183mYou walk around the observatory.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou admire the \e[38;5;220mlarge telescope\e[38;5;183m in the middle of the room.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mIt's made of \e[38;5;220mpolished brass\e[38;5;183m and \e[38;5;153mglass\e[38;5;183m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mIt looks ancient yet sophisticated.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou run your fingers along the cool metal surface...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou wonder if it ever gets used...\n\e[0m")
          gets

        when 2
          slow_print("\n\e[38;5;183mYou decide to take a look through the \e[38;5;220mtelescope\e[38;5;183m...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou take a deep breath, and step up to it...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mThen you slowly bring your eye to the eyepiece.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mSomeone left it pointed at the \e[38;5;255mmoon\e[38;5;183m...\n\e[0m")
          gets
          slow_print("\n\e[38;5;255mit\e[38;5;183m is bright and full.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou can see the craters and mountains on \e[38;5;255mits\e[38;5;183m surface.\n\e[0m")
          gets
          slow_print("\n\e[97mIts like looking at a giant, divine, glowing marble...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou stare at \e[38;5;255mit\e[38;5;183m in awe...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183m...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183m......\n\e[0m")
          gets
          slow_print("\n\e[38;5;183m............\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou decide to step away from the \e[38;5;220mtelescope\e[38;5;183m.\n\e[0m")
          gets

        when 3
          slow_print("\n\e[38;5;183mYou approach the \e[38;5;220mtelescope\e[38;5;183m once more, drawn by something you can't explain.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou peer through the eyepiece, expecting stars—but find something else.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mThe sky looks... wrong.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mThe constellations shimmer out of alignment, swirling faintly like they're alive.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mOne star pulses. Then another. Then five at once, forming a pattern you somehow recognize.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYour heart beats faster. A whisper forms in your mind, but it's not in your voice...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183m“Almost ready...”\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou stagger back from the \e[38;5;220mtelescope\e[38;5;183m, dizzy and breathless.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mThe whisper fades, but the unease lingers like fog around your thoughts.\n\e[0m")
          gets

        when 4
          slow_print("\n\e[38;5;183mDrawn once more to the \e[38;5;220mtelescope\e[38;5;183m, you press your eye to the glass...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou scan the stars. They shimmer unnaturally, like they're watching back.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou blink, and for a moment, all you see is \e[38;5;239mblack\e[38;5;183m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mThen something glows... a shape, a symbol, etched in light behind your eyes.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mYou jerk away from the telescope, breath caught in your chest.\n\e[0m")
          gets
          slow_print("\n\e[38;5;202mA sharp, acrid scent hits your nose.\n\e[0m")
          gets
          slow_print("\n\e[38;5;202mThe smell of burning.\n\e[0m")
          gets
          slow_print("\n\e[38;5;202mYou spin around and freeze.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mOn the floor behind you, a sigil glows faintly red.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mA Pentagram freshly burned into the checkerboard tiles.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mIts edges still embered, heat still radiating from it.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mIt pulses like a heartbeat.\n\e[0m")
          gets
          slow_print("\n\e[38;5;135mThe room is silent, but the air is alive with tension.\n\e[0m")
          gets
          $sigil_appeared = true

        else
          slow_print("\n\e[38;5;183mYou look through the \e[38;5;220mtelescope\e[38;5;183m once more,\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mBut all you see is \e[38;5;239mblack\e[38;5;183m.\n\e[0m")
          gets

        end

      when "view desk", "5"
        $view_desk["observatory"] += 1
        desk_times = $view_desk["observatory"]
        case desk_times
        when 1
          slow_print("\n\e[38;5;183mYou walk over to the \e[38;5;180mantique wooden desk\e[38;5;183m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mIt is covered in papers and writing utensils,\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mand a \e[38;5;198mmysterious book\e[38;5;183m that appears to be in an unknown language,\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mand a \e[38;5;123mstrange device\e[38;5;183m with glowing symbols.\n\e[0m")
          gets

        when 2
          slow_print("\n\e[38;5;183mYou decide to take a closer look at the \e[38;5;180mantique wooden desk\e[38;5;183m...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou pick up the \e[38;5;198mmysterious book\e[38;5;183m and flip through its pages...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mThe writing is in a language you don't understand...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou put the \e[38;5;198mmysterious book\e[38;5;183m back down and pick up the \e[38;5;123mstrange device\e[38;5;183m...\n\e[0m")
          gets
          slow_print("\n\e[38;5;123mIt has glowing symbols on it that \e[38;5;123mpulse with light\e[38;5;123m...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou feel a strange energy emanating from it...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou decide to put it back down and step away from the desk.\n\e[0m")
          gets

        when 3
          slow_print("\n\e[38;5;183mYou decide to take another look at the \e[38;5;180mantique wooden desk\e[38;5;183m...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou pick up the \e[38;5;198mmysterious book\e[38;5;183m again and try to decipher its contents...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou get chills and have the sudden insight it is a book of spells and incantations...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mIt might be trying to communicate with you...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mIt almost seems to be calling your name...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou decide to put the \e[38;5;198mmysterious book\e[38;5;183m in your bag.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183m*\e[38;5;198mmysterious book\e[38;5;183m has been added to your bag*\n\e[0m")
          gets
          $inventory << "mysterious book"
          $ritual_items["mysterious_book"] = true
          save_game("autosave")

        when 4
          slow_print("\n\e[38;5;183mYou can't stop thinking about the \e[38;5;123mstrange device\e[38;5;183m on the desk.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou feel like it holds some kind of power...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou slowly reach out your hand and hold it just above the device.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou feel a tingling sensation in your fingertips...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou decide to put your hand on the \e[38;5;123mstrange device\e[38;5;183m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mAs soon as you do, the symbols on the device \e[97mflash with a bright white light\e[38;5;183m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou feel a surge of energy course through your body.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou feel like this device is somehow connected to the book, and you...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou decide to put the \e[38;5;123mstrange device\e[38;5;183m in your bag.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183m*\e[38;5;123mstrange device\e[38;5;183m has been added to your bag*\n\e[0m")
          gets
          $inventory << "strange device"
          $ritual_items["strange_device"] = true
          save_game("autosave")

          when 5
          slow_print("\n\e[38;5;183mYou decide to open the drawers on the \e[38;5;180mantique wooden desk\e[38;5;183m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou find some old papers and a bunch of used writing utensils in the first drawer.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mThe old papers seem to be sketches of this very castle, early designs maybe.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou open the second drawer.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou find a small wooden box with a latch on it, and a \e[38;5;208mbox of matches\e[38;5;183m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou open the box and find a piece of \e[38;5;137msandalwood incense\e[38;5;183m inside.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mThe incense smells wonderful.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mThe smell is so inviting its almost like it wants you to take it.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou take the \e[38;5;137msandalwood incense\e[38;5;183m, and the \e[38;5;208mbox of matches\e[38;5;183m and put them in your bag.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183m*\e[38;5;137msandalwood incense\e[38;5;183m has been added to your bag*\n\e[0m")
          gets
          slow_print("\n\e[38;5;183m*\e[38;5;208mbox of matches\e[38;5;183m has been added to your bag*\n\e[0m")
          gets
          $inventory << "sandalwood incense"
          $ritual_items["sandalwood_incense"] = true
          $inventory << "box of matches"
          $ritual_items["box_of_matches"] = true
          save_game("autosave")
          $ritual_items_collected = true

          else
          slow_print("\n\e[38;5;183mYou have taken everything that once adorned this \e[38;5;180mantique wooden desk\e[38;5;183m.\n\e[0m")
          gets

        end

      when "stay", "1"
        $stay_counts["observatory"] += 1
        times_stayed = $stay_counts["observatory"]

        # ---- FAST PATH: both flags true -> immediately "The room responds..." ----
        if $sigil_appeared && $ritual_items_collected && !$ritual_ready
          slow_print("\n\e[38;5;201mThe room seems to respond to your presence now.\n\e[0m")
          gets
          slow_print("\n\e[38;5;201mThe pentagram pulses faintly with light as you approach it.\n\e[0m")
          gets
          slow_print("\n\e[38;5;201mYou feel the three items in your bag hum with resonance.\n\e[0m")
          gets
          slow_print("\n\e[38;5;201mA voice—not heard, but known—whispers:\n\e[0m")
          gets
          slow_print(%(\e[38;5;135m"Lay them down. Step into the circle. You will be shown the truth."\e[0m\n))
          gets
          slow_print("\n\e[38;5;201mYou are now able to begin the ritual.\n\e[0m")
          gets
          $ritual_ready = true
          next
        end

        # ---- Otherwise, branch by times stayed ----
        case times_stayed
        when 1
          slow_print("\n\e[38;5;183mYou take a moment to appreciate the beauty of the observatory.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mThe air is crisp and still, charged with quiet anticipation.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou notice the stars above seem unusually bright tonight.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mFor a moment, time feels slower—as if something is watching you.\n\e[0m")
          gets

        when 2
          slow_print("\n\e[38;5;183mYou wander the room in silence.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYour eyes catch strange etchings on the base of the telescope.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mThey resemble constellations… but none that you recognize.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mA faint humming noise pulses in your ears, but there's no sound in the room.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou feel a pressure behind your eyes, as if reality is thinning just slightly.\n\e[0m")
          gets

        when 3
          slow_print("\n\e[38;5;183mYou decide to stay a bit longer...\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou begin to look at the books on the shelves.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mBooks about astronomy, space travel, and the cosmos.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mBooks about astrology, horoscopes, and the zodiac.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mBooks about the history of the universe and its mysteries.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mBooks of gods, mythology, and magick.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou notice a red book that has nothing on the cover.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou pull it off the shelf and open it.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mIt is a book of spells and incantations.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou feel a strange energy emanating from it.\n\e[0m")
          gets
          slow_print("\n\e[38;5;183mYou decide to put it back on the shelf.\n\e[0m")
          gets

        when 4
          if $ritual_items_collected && !$sigil_appeared
            slow_print("\n\e[38;5;183mYou linger... but feel there's something else you must gather before proceeding.\n\e[0m")
            gets
            slow_print("\n\e[38;5;183mPerhaps the telescope could reveal more...\n\e[0m")
            gets
          else
            slow_print("\n\e[38;5;183mYou feel a strange energy in the room, but nothing seems to happen.\n\e[0m")
            gets
          end

        when 5
          if $sigil_appeared && !$ritual_items_collected
            slow_print("\n\e[38;5;183mThe sigil on the floor seems to pulse in response to your thoughts.\n\e[0m")
            gets
            slow_print("\n\e[38;5;183mMaybe something on the desk has information about this sigil.\n\e[0m")
            gets
          else
            slow_print("\n\e[38;5;183mYou feel a strange energy in the room, but nothing seems to happen.\n\e[0m")
            gets
          end

        else
          # stayed enough, but haven't met either condition
          slow_print("\n\e[38;5;183mYou feel a strange energy in the room, but nothing seems to happen.\n\e[0m")
          gets
        end


      when "enter sigil", "8"
        if $sigil_appeared && $ritual_items_collected && $ritual_ready
          return perform_ritual
        end

      else
      slow_print("\n\e[38;5;183mThat is not a choice in this moment...\n\e[0m")
    end
  end
end
