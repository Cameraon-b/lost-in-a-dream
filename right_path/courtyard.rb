#5th room in the right path
# This method represents the courtyard in the game.
def courtyard
$ascii_courtyard = [
"    __   ___   __ __  ____  ______  __ __   ____  ____   ___   ",
"   /  ] /   \\ |  |  ||    \\|      ||  |  | /    ||    \\ |   \\  ",
"  /  / |     ||  |  ||  D  )      ||  |  ||  o  ||  D  )|    \\ ",
" /  /  |  O  ||  |  ||    /|_|  |_||  ~  ||     ||    / |  D  |",
"/   \\_ |     ||  :  ||    \\  |  |  |___, ||  _  ||    \\ |     |",
"\\     ||     ||     ||  .  \\ |  |  |     ||  |  ||  .  \\|     |",
" \\____| \\___/  \\__,_||__|\\_| |__|  |____/ |__|__||__|\\_||_____|",
"                                                               "
]
  $ascii_courtyard.each_with_index do |line, index|
    puts "\e[1;38;5;153m#{line}\e[0m"
  end

  # Create a gradient effect for the vines
  greens = [22, 28, 34, 40, 46, 82, 118, 154, 190, 226] # Dark to light
  text = "vines growing all over"
  vines_colored = ""

  # Apply the gradient to each character in the text
  text.chars.each_with_index do |char, i|
    color = greens[i % greens.length]
    vines_colored += "\e[38;5;#{color}m#{char}\e[0m"
  end

  visits = increment_visit("courtyard", $day_or_night)

  if $day_or_night == "day"
    case visits
    when 1
      slow_print("\n\e[38;5;153mYou find yourself in a beautiful courtyard.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mThe walls are made of \e[97mwhite stone\e[38;5;153m, and there are \e[0m", 0.03, false)
      slow_print(vines_colored, 0.0005, false)
      slow_print("\e[38;5;153m.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mThere are \e[38;5;22msmall, dense bushes\e[38;5;153m that line the courtyard walls.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mOrnate \e[38;5;240miron spikes\e[38;5;153m adorn the top of the walls.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mThere is a small fountain in the center of the courtyard, with \e[38;5;25mwater trickling down\e[38;5;153m.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mThere is a \e[31mred brick path\e[38;5;153m from door to door that wraps around the fountain.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mBeyond the path there is \e[38;5;22mlush green lawn consisting of clover and grasses\e[38;5;153m.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mThe \e[38;5;195mair\e[38;5;153m is fresh and clean, and you can hear birds chirping.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mThere are several benches around the courtyard, and two \e[38;5;94mtrees\e[38;5;153m on either side providing \e[38;5;239mshade\e[38;5;153m.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mYou feel a sense of peace, you think you should stay for awhile.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mThere is a door on the opposite side of the courtyard.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mA fiery \e[38;5;196mruby door\e[38;5;153m with a glistening \e[38;5;196mruby crystal knob\e[38;5;153m.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mThe door has a ring carved in the middle.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mThe center of the ring is \e[38;5;250msilver\e[38;5;153m.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mIt almost looks like something is missing from it...\n\e[0m")
      gets

    when 2
      slow_print("\n\e[38;5;153mYou find yourself in the courtyard.\n\e[0m")
      gets

    else
      slow_print("\n\e[38;5;153mYou are in the courtyard.\n\e[0m")
      gets

    end

  else #night
    case visits
    when 1
      slow_print("\n\e[38;5;153mYou find yourself in the courtyard bathed in \e[38;5;255mmoonlight\e[38;5;153m.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mThe \e[97mwhite\e[38;5;153m stone walls glow faintly under the pale light, and shadows sway gently in the cool night air.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mThe ornate \e[38;5;240miron spikes\e[38;5;153m atop the walls glint faintly.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mThe fountain at the center murmurs softly, the \e[38;5;25mwater\e[38;5;153m reflecting tiny shards of starlight.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mThe \e[38;5;195mair\e[38;5;153m is crisp, carrying the faint scent of blooming night flowers.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mThe benches and \e[38;5;94mtrees\e[38;5;153m cast long, gentle shadows.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mYou feel a deep, serene calm.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mAcross the courtyard, the fiery \e[38;5;196mruby door\e[38;5;153m gleams warmly even in the dark.\n\e[0m")
      gets
      slow_print("\n\e[38;5;153mIts crystal knob catches the \e[38;5;255mmoonlight\e[38;5;153m, scattering faint red reflections.\n\e[0m")
      gets

    when 2
      slow_print("\n\e[38;5;153mYou find yourself in the moonlit courtyard again.\n\e[0m")
      gets

    when 3
      slow_print("\n\e[38;5;153mYou are back in the courtyard, the shadows long and the air cool.\n\e[0m")
      gets
    end
  end

  loop do
    slow_print("\n\e[38;5;153mYou must make a choice: \n1. explore\n2. back\n3. eat\n4. sleep\n5. stay \n6. menu\n\e[0m")
    print "> "
    choice = gets.chomp.downcase

      case choice

      when "explore", "1"
        # If the player has already unlocked the ruby room
        if $doors_unlocked["ruby_room"]
          slow_print("\n\e[38;5;153mYou step up to the \e[38;5;196mruby door\e[38;5;153m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;153mYou push on the door and it opens easily.\n\e[0m")
          gets
          slow_print("\n\e[38;5;153mYou step through the \e[38;5;196mruby door\e[38;5;153m into the ruby room.\n\e[0m")
          gets
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "ruby_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          short_load_animation
          return "ruby_room"

        # If the player has the silver ring, they can unlock the ruby room
        elsif $inventory.include?("silver ring")
          slow_print("\n\e[38;5;153mYou step up to the \e[38;5;196mruby door\e[38;5;153m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;153mYou take the \e[38;5;250msilver ring\e[38;5;153m from your pocket and place it in the ring carved in the door.\n\e[0m")
          gets
          slow_print("\n\e[38;5;153mThe ring fits perfectly, and the door clicks open.\n\e[0m")
          gets
          slow_print("\n\e[38;5;153mYou step through the \e[38;5;196mruby door\e[38;5;153m.\n\e[0m")
          gets
          $doors_unlocked["ruby_room"] = true # Unlock the ruby room door
          $inventory.delete("silver ring") # Remove the ring after use
          save_game("autosave") # Autosave after unlocking the door
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "ruby_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          short_load_animation
          return "ruby_room"

        # If the player doesn't have the silver ring, they can't unlock the ruby room
        else
          slow_print("\n\e[38;5;153mYou try to push the \e[38;5;196mruby door\e[38;5;153m, but it won't budge.\n\e[0m")
          gets
          slow_print("\n\e[38;5;153mYou glance at the ring carved in the door.\n\e[0m")
          gets
          slow_print("\n\e[38;5;153mThe center of the ring is \e[38;5;250msilver\e[38;5;153m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;153mYou need to find the \e[38;5;250msilver ring\e[38;5;153m.\n\e[0m")
          gets
          return "courtyard"
        end

      when "back", "2"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "baths", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "baths"

      when "eat", "3"
        return eat("courtyard")

      when "sleep", "4"
        return sleep_action_courtyard("courtyard")

      when "menu", "6"
        menu_handler
        return if $just_loaded_game # If just loaded, return to avoid changing room

      when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room
        return "courtyard" # Return to courtyard if no new room

      when "stay", "5"
        times_stayed = increment_stay("courtyard", $day_or_night)

        if $day_or_night == "day" # stay during the day
          case times_stayed
          when 1
            if !$fountain_checked # Player hasn't checked the fountain yet
              slow_print("\n\e[38;5;153mYou walk slowly around the courtyard...\n\e[0m")
              gets
              slow_print("\n\e[38;5;153mYou take a moment to appreciate the beauty of your surroundings.\n\e[0m")
              gets
              slow_print("\n\e[38;5;153mThe gentle sound of the fountain is soothing, and you find yourself relaxing.\n\e[0m")
              gets
              slow_print("\n\e[38;5;153mYou could spend all day here.\n\e[0m")
              gets
              slow_print("\n\e[38;5;153mYou walk over to the fountain and sit on the edge...\n\e[0m")
              gets
              slow_print("\n\e[38;5;153mYou dip your fingers into the water, feeling the coolness against your skin.\n\e[0m")
              gets
              slow_print("\n\e[38;5;153mYou notice something towards the center of the fountain...\n\e[0m")
              gets
              slow_print("\n\e[38;5;153mIt looks like a small, \e[38;5;235mblack\e[38;5;153m object...\n\e[0m")
              gets
              slow_print("\n\e[38;5;153mYou reach in and pull it out...\n\e[0m")
              gets
              slow_print("\n\e[38;5;153mIt is a small \e[38;5;235mblack key\e[38;5;153m!\n\e[0m")
              gets
              slow_print("\n\e[38;5;153mYou put the key in your pocket, you feel lucky.\n\e[0m")
              gets
              $inventory << "black key" # Add the black key to the inventory
              $fountain_checked = true # Player has checked the fountain
              slow_print("\n\e[38;5;153m*\e[38;5;235mblack key\e[38;5;153m has been added to your bag*\n\e[0m")
              save_game("autosave") # Autosave after finding the key

            else # Player has checked the fountain
              slow_print("\n\e[38;5;153mYou sit on a bench in the courtyard...\n\e[0m")
              gets
              slow_print("\n\e[38;5;153mYou take a deep breath and enjoy the fresh air...\n\e[0m")
              gets
              slow_print("\n\e[38;5;153mYou listen to the birds chirping in the trees...\n\e[0m")
              gets
              slow_print("\n\e[38;5;153mYou can see some of them fly from the trees.\n\e[0m")
              gets
              slow_print("\n\e[38;5;153mIt really is a beautiful courtyard.\n\e[0m")
              gets
              slow_print("\n\e[38;5;153m...\n\e[0m")
              gets
              slow_print("\n\e[38;5;153m......\n\e[0m")
              gets
              slow_print("\n\e[38;5;153m............\n\e[0m")
              gets
            end

          when 2
            slow_print("\n\e[38;5;153mYou lean back on the bench and close your eyes...\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mThe warmth of the \e[1;38;5;220msun\e[38;5;153m feels comforting at first...\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mBut then, for just a moment, a chill runs through the air.\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mSome bushes rustle as if something invisible has brushed past them.\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mYou open your eyes, but the courtyard looks exactly the same.\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mStill, you cannot shake the feeling that you're not alone.\n\e[0m")
            gets

          when 3
            slow_print("\n\e[38;5;153mYou wander slowly along the courtyard path...\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mThe leaves in the trees sway gently, though there is no wind.\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mTheir colors seem brighter here, almost unnaturally \e[38;5;22mgreen\e[38;5;153m.\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mYou pause at the fountain again, listening to the water...\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mFor a fleeting moment, the sound resembles a whisper.\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mYou blink, and it is only the trickle of water once more.\n\e[0m")
            gets

          else
            slow_print("\n\e[38;5;153mThe water in the fountain suddenly stops trickling down...\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mIt grows uncomfortablely silent, not a sound to be heard.\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mYou feel it's time to leave the courtyard.\n\e[0m")
            gets
            short_load_animation

            if $doors_unlocked["ruby_room"]
              $previous_room = $current_room
              $travel_log << { from: $current_room, to: "ruby_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
              return "ruby_room"

            else
              $previous_room = $current_room
              $travel_log << { from: $current_room, to: "baths", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
              return "baths"
            end
          end

        elsif $day_or_night == "night" #stay at night
          case times_stayed
          when 1
            slow_print("\n\e[38;5;153mThe courtyard is quiet at night...\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mThe \e[38;5;255mmoon\e[38;5;153m casts long shadows on the ground...\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mYou can hear the breeze in the distance, but you don't feel it...\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mIt's a peaceful atmosphere...\n\e[0m")
            gets

          when 2
            slow_print("\n\e[38;5;153mYou sit quietly, letting the silence press in around you...\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mThe \e[38;5;255mmoon\e[38;5;153m seems unnaturally large tonight, hanging low above the trees.\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mIts pale glow turns the brick path \e[38;5;250msilver\e[38;5;153m, almost liquid in appearance.\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mFor an instant, the reflection of the \e[38;5;255mmoon\e[38;5;153m in the fountain looks like an eye staring back at you.\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mYou blink, and it is just the \e[38;5;255mmoon\e[38;5;153m.\n\e[0m")
            gets

          when 3
            slow_print("\n\e[38;5;153mA faint rustling drifts from the far corner of the courtyard...\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mThe shadows there feel deeper than they should, refusing to yield detail.\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mThe longer you stare, the more the darkness seems to shift and breathe.\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mFeeling a chill run down your spine, you shiver and avert your gaze.\n\e[0m")
            gets

          when 4
            slow_print("\n\e[38;5;153mYou decide to walk over to where you heard the rustling...\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mYou must face your fears...\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mYou cautiously approach the bushes in the corner...\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mSomething glimmers in the \e[38;5;255mmoonlight\e[38;5;153m...\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mAs you get closer, you see it's a \e[38;5;235mpendulum\e[38;5;153m.\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mA shimmering piece of \e[97mquartz\e[38;5;153m cut into a pyramid shape.\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mDangling on a \e[38;5;244msilver chain\e[38;5;153m...\n\e[0m")
            gets
            $inventory << "pendulum" # Add the pendulum to the inventory
            $easter_egg_found[:pendulum] = true # Set the pendulum flag to true
            slow_print("\n\e[38;5;153m*\e[38;5;235mpendulum\e[38;5;153m has been added to your bag*\n\e[0m")
            save_game("autosave") # Autosave after finding the pendulum

          else
            slow_print("\n\e[38;5;153mYou begin to hear whispers all around you...\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mBut you can't quite make out the words...\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mThey almost sound like a radio broadcast...\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mYour ears start to ring...\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mYou feel a strange pressure building around you...\n\e[0m")
            gets
            slow_print("\n\e[38;5;153mYou feel it's time to leave the courtyard.\n\e[0m")
            gets
            short_load_animation

            if $doors_unlocked["ruby_room"]
              $previous_room = $current_room
              $travel_log << { from: $current_room, to: "ruby_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
              return "ruby_room"

            else
              $previous_room = $current_room
              $travel_log << { from: $current_room, to: "baths", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
              return "baths"
            end
          end
        end

      else
      slow_print("\n\e[38;5;153mThat is not a choice in this moment...\n\e[0m")
    end
  end
end