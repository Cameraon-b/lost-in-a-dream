#4th room in the middle path
#def greenhouse method
def greenhouse

  $ascii_greenhouse = [
"  ____  ____     ___    ___  ____   __ __   ___   __ __  _____   ___ ",
" /    ||    \\   /  _]  /  _]|    \\ |  |  | /   \\ |  |  |/ ___/  /  _]",
"|   __||  D  ) /  [_  /  [_ |  _  ||  |  ||     ||  |  (   \\_  /  [_ ",
"|  |  ||    / |    _]|    _]|  |  ||  _  ||  O  ||  |  |\\__  ||    _]",
"|  |_ ||    \\ |   [_ |   [_ |  |  ||  |  ||     ||  :  |/  \\ ||   [_ ",
"|     ||  .  \\|     ||     ||  |  ||  |  ||     ||     |\\    ||     |",
"|___,_||__|\\_||_____||_____||__|__||__|__| \\___/  \\__,_| \\___||_____|",
"                                                                     "
  ]
  $ascii_greenhouse.each_with_index do |line, index|
    puts "\e[1;38;5;83m#{line}\e[0m"
  end

visits = increment_visit("greenhouse", $day_or_night)

  # loop through the visits to the greenhouse
  # and print different messages based on the number of visits

  if $day_or_night == "day"
    case visits
    when 1
      slow_print("\n\e[38;5;83mYou find yourself in a greenhouse.\n\e[0m")
      gets
      slow_print("\n\e[38;5;83mThe walls and ceiling are made of \e[38;5;153mglass\e[38;5;83m.\n\e[0m")
      gets
      slow_print("\n\e[38;5;83mThere is a \e[97msmall white stone path\e[38;5;83m through the middle.\n\e[0m")
      gets
      slow_print("\n\e[38;5;83mThe \e[38;5;220msunlight\e[38;5;83m is pouring through the \e[38;5;153mglass\e[38;5;83m surrounding you.\n\e[0m")
      gets
      slow_print("\n\e[38;5;83mThere are all kinds of plants growing around you.\n\e[0m")
      gets
      slow_print("\n\e[38;5;83mSome you recognize, others you have never even seen in a book.\n\e[0m")
      gets
      slow_print("\n\e[38;5;83mYou feel embraced and welcomed by the life around you.\n\e[0m")
      gets
      slow_print("\n\e[38;5;83mThrough the \e[38;5;153mglass\e[38;5;83m you can see a garden.\n\e[0m")
      gets
      slow_print("\n\e[38;5;83mThe door is slightly ajar.\n\e[0m")
      gets

    when 2
      slow_print("\n\e[38;5;83mYou find yourself in the greenhouse again.\n\e[0m")
      gets
      slow_print("\n\e[38;5;83mThe air inside the greenhouse feels warmer than outside.\n\e[0m")
      gets
      slow_print("\n\e[38;5;83mBeads of condensation slide down the \e[38;5;153mglass\e[38;5;83m, catching the \e[38;5;220msunlight\e[38;5;83m in tiny rainbow arcs.\n\e[0m")
      gets
      slow_print("\n\e[38;5;83mYou hear a faint buzzing, a \e[38;5;16mb\e[38;5;226me\e[38;5;16me\e[38;5;83m drifting lazily among the blooms.\n\e[0m")
      gets


    when 3
      slow_print("\n\e[38;5;83mYou are back in the greenhouse.\n\e[0m")
      gets
      slow_print("\n\e[38;5;83mIt smells strongly of earth and greenery.\n\e[0m")
      gets
      slow_print("\n\e[38;5;83mSome flowers have opened wider since your last visit, as if welcoming you back.\n\e[0m")
      gets
      slow_print("\n\e[38;5;83mYou feel refreshed, just breathing in the living air here.\n\e[0m")
      gets

    else
      slow_print("\n\e[38;5;83mYou are in the greenhouse.\n\e[0m")
      gets

    end

  else #night
    case visits
    when 1
      slow_print("\n\e[38;5;83mThe greenhouse at night feels like another world.\n\e[0m")
      gets
      slow_print("\n\e[38;5;255mMoonlight\e[38;5;83m filters through the \e[38;5;153mglass\e[38;5;83m, bending and scattering across the leaves.\n\e[0m")
      gets
      slow_print("\n\e[38;5;83mThe plants cast strange, shifting shadows that seem to move on their own.\n\e[0m")
      gets


      when 2
      slow_print("\n\e[38;5;83mA cool dampness clings to the air as you step inside.\n\e[0m")
      gets
      slow_print("\n\e[38;5;83mDroplets of dew cling to the leaves, each one catching the \e[38;5;255mmoonlight\e[38;5;83m in a faint shimmer.\n\e[0m")
      gets
      slow_print("\n\e[38;5;83mThe scent of wet soil and greenery is stronger in the stillness.\n\e[0m")
      gets


      when 3
        slow_print("\n\e[38;5;83mThe silence here is absolute, save for the occasional creak of the \e[38;5;153mglass\e[38;5;83m settling.\n\e[0m")
        gets
        slow_print("\n\e[38;5;83mYou notice a pale flower blooming only in the \e[38;5;255moonlight\e[38;5;83m, its petals faintly glowing.\n\e[0m")
        gets
        slow_print("\n\e[38;5;83mIt feels as though the greenhouse is watching you, quietly breathing in the dark.\n\e[0m")
        gets

      else
        slow_print("\n\e[38;5;83mYou are in the greenhouse.\n\e[0m")
        gets

    end
  end

  loop do
    slow_print("\n\e[38;5;83mYou must make a choice: \n1. explore\n2. back\n3. eat\n4. sleep \n5. stay \n6. menu\n\e[0m")
    print "> "
    choice = gets.chomp.downcase

      case choice
      when "explore", "1"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "garden", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "garden"

      when "back", "2"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "brown_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "brown_room"

      when "eat", "3"
        return eat("greenhouse")

      when "sleep", "4"
        return sleep_action("greenhouse")

      when "menu", "6"
        menu_handler
        return if $just_loaded_game # If just loaded, return to avoid changing room

      when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room

      when "stay", "5"
        times_stayed = increment_stay("greenhouse", $day_or_night)

        if $day_or_night == "day"
          case times_stayed
          when 1
            slow_print("\n\e[38;5;83mYou settle among the humid leaves, the plants around you seem to lean in, seeking the \e[38;5;220mlight\e[38;5;83m.\n\e[0m")
            gets
            slow_print("\n\e[38;5;83mCondensation beads on the glass and slides down in wandering paths, like the greenhouse is drawing its own maps.\n\e[0m")
            gets
            slow_print("\n\e[38;5;83mYou breathe in warm earth, chlorophyll, and a memory you can't place.\n\e[0m")
            gets

          when 2
            slow_print("\n\e[38;5;83mSomewhere, a drip periodically meets a leaf with a hollow tap....\n\e[0m")
            gets
            slow_print("\n\e[38;5;83mTap...\n\e[0m")
            gets
            slow_print("\n\e[38;5;83mTap...\n\e[0m")
            gets
            slow_print("\n\e[38;5;83mTap...\n\e[0m")
            gets
            slow_print("\n\e[38;5;83mThe plants seem to be humming in a language of their own.\n\e[0m")
            gets
            slow_print("\n\e[38;5;83mYou are only a guest to the plants in the greenhouse...\n\e[0m")
            gets

          when 3
            slow_print("\n\e[38;5;83mYou brush a fingertip along a waxy leaf; it springs back with resilience.\n\e[0m")
            gets
            slow_print("\n\e[38;5;83mThe plants lean toward the \e[38;5;220msun.\n\e[0m")
            gets
            slow_print("\n\e[38;5;83mLife here is busy, you musn't interupt them.\n\e[0m")
            gets

          else
            slow_print("\n\e[38;5;83mThe greenhouse feels complete without you for now.\n\e[0m")
            gets
            slow_print("\n\e[38;5;83mA path of stone nudges your eye toward the garden door.\n\e[0m")
            gets
            short_load_animation
            $previous_room = $current_room
            $travel_log << { from: $current_room, to: "garden", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
            return "garden"
          end

        elsif $day_or_night == "night"
          case times_stayed
          when 1
            slow_print("\n\e[38;5;255mMoonlight\e[38;5;83m is reflected in puddles on stone path.\n\e[0m")
            gets
            slow_print("\n\e[38;5;83mLeaves cast moving lattices across your hands when you hold them out.\n\e[0m")
            gets
            slow_print("\n\e[38;5;83mYou can almost hear the plants sighing at the \e[1;38;5;255mmoon\e[38;5;83m.\n\e[0m")
            gets

          when 2
            slow_print("\n\e[38;5;83mThe air is rich with the smell of cool metal, wet stone, and moist dirt.\n\e[0m")
            gets
            slow_print("\n\e[38;5;83mThe flowers seem to have fallen asleep, resting in the \e[38;5;255mmoon's cool glow\e[38;5;83m.\n\e[0m")
            gets

          when 3
            slow_print("\n\e[38;5;83mA flicker of movement catches your eye...\n\e[0m")
            gets
            slow_print("\n\e[38;5;83mbut you think it was just \e[38;5;255mlight\e[38;5;83m cutting through the leaves.\n\e[0m")
            gets
            slow_print("\n\e[38;5;83mYou notice a faint glow coming from the corner of the greenhouse.\n\e[0m")
            gets
            slow_print("\n\e[38;5;83mYou push aside a cluster of ivy and find an object resting on a bed of moss.\n\e[0m")
            gets
            slow_print("\n\e[38;5;83mIt's a smooth, flawless \e[38;5;250mcrystal ball\e[38;5;83m, cool to the touch.\n\e[0m")
            gets
            $inventory << "crystal ball"
            $easter_egg_found["crystal_ball"] = true
            slow_print("\n\e[38;5;83m*\e[38;5;250mcrystal ball\e[38;5;83m has been added to your bag*\n\e[0m")
            gets
            save_game("autosave") # Autosave after finding the crystal ball

          else
            slow_print("\n\e[38;5;83mThe night presses lightly at the panes; something wordless beckons you elsewhere.\n\e[0m")
            gets
            short_load_animation
            $previous_room = $current_room
            $travel_log << { from: $current_room, to: "brown_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
            return "brown_room"
          end
        end


      else
        slow_print("\n\e[38;5;83mThat is not a choice in this moment...\n\e[0m")
        
      end
  end
end