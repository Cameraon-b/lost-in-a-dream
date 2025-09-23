#5th room in the middle path
# This method represents the garden in the game.
def garden

  $ascii_garden = [
"  ____   ____  ____   ___      ___  ____  ",
" /    | /    ||    \\ |   \\    /  _]|    \\ ",
"|   __||  o  ||  D  )|    \\  /  [_ |  _  |",
"|  |  ||     ||    / |  D  ||    _]|  |  |",
"|  |_ ||  _  ||    \\ |     ||   [_ |  |  |",
"|     ||  |  ||  .  \\|     ||     ||  |  |",
"|___,_||__|__||__|\\_||_____||_____||__|__|",
"                                            "
  ]
  $ascii_garden.each_with_index do |line, index|
    puts "\e[1;38;5;22m#{line}\e[0m"
  end

  # color gradients for the flowers
  vibrant_flowers_colored = "\e[38;5;213mv\e[0m\e[38;5;206mi\e[0m\e[38;5;219mb\e[0m\e[38;5;207mr\e[0m\e[38;5;210ma\e[0m\e[38;5;207mn\e[0m\e[38;5;210mt\e[0m \e[38;5;225mf\e[0m\e[38;5;200ml\e[0m\e[38;5;213mo\e[0m\e[38;5;219mw\e[0m\e[38;5;218me\e[0m\e[38;5;225mr\e[0m\e[38;5;198ms\e[0m"

  # color gradient for the "million shades of green"
  greens = [22, 28, 34, 40, 46, 82, 118, 154, 190, 226] # Dark to light
  text = "million shades of green"
  million_shades_colored = ""

  # Apply the color gradient to each character in the text
  text.chars.each_with_index do |char, i|
    color = greens[i * greens.length / text.length] || greens.last
    million_shades_colored += "\e[38;5;#{color}m#{char}\e[0m"
  end

  # sperate visits counts for day and night
  visits = increment_visit("garden", $day_or_night)

  # loop through the visits to the garden
  # and print different messages based on the number of visits and the time of day
if $day_or_night == "day"
  case visits
  when 1
    slow_print("\n\e[38;5;22mYou find yourself in a \e[1;38;5;22mlush\e[38;5;22m and lively garden.\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mThe walls and grounds are covered with \e[0m",0.03, false)
    slow_print(vibrant_flowers_colored, 0.0005, false)
    slow_print("\e[38;5;22m of all kinds.\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mYou see a \e[0m", 0.03, false)
    slow_print(million_shades_colored, 0.0005, false)
    slow_print("\e[38;5;22m glowing in the \e[1;38;5;220msunlight.\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mLike the \e[38;5;83mgreenhouse\e[38;5;22m there are some plants you recognize,\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mand others that must have come from somewhere else.\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mIn the middle of the garden is a \e[38;5;94mlarge old oak tree\e[38;5;22m.\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mIt is a majestic tree, with a \e[38;5;94mthick trunk\e[38;5;22m and \e[38;5;94mwide, wild branches\e[38;5;22m.\n\e[0m")
    gets
    slow_print("\n\e[1;38;5;22mBursting with thick green leaves, dancing in the breeze.\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mThis garden is magical, someone must truly care for these plants.\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mYou feel like you should stay awhile.\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mYou notice a door on the opposite side of the garden.\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mIt is a mesmerizing \e[38;5;40memerald door\e[38;5;22m.\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mIt makes you think of \e[38;5;40msour apple candy\e[38;5;22m,\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mbut also of something ancient...\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mYou notice a circular notch in the door.\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mIt has a smaller raised circle in the center, made of \e[38;5;166mcopper\e[38;5;22m.\n\e[0m")
    gets

  when 2
    slow_print("\n\e[38;5;22mYou find yourself in the garden.\n\e[0m")
    gets

  else
    slow_print("\n\e[38;5;22mYou are in the garden.\n\e[0m")
    gets
  end

else #night
  case visits 
  when 1
    slow_print("\n\e[38;5;22mYou step into the garden, bathed in \e[1;38;5;250mpale moonlight\e[38;5;22m.\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mThe \e[1;38;5;250mmoon\e[38;5;22m casts silver edges on the leaves, and the flowers seem to sleep.\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mA faint fragrance lingers in the cool night air, rich and sweet.\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mSomewhere beyond the \e[38;5;94moak tree\e[38;5;22m, you hear the soft hum of nocturnal life.\n\e[0m")
    gets

  when 2
    slow_print("\n\e[38;5;22mThe garden greets you with shadows and quiet.\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mA gentle breeze stirs, setting the leaves to whispering.\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mThe \e[38;5;94mold oak tree\e[38;5;22m stands like a silent guardian, its branches swaying slowly.\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mSomewhere in the darkness, you think you see a flower close itself as if shy to the night.\n\e[0m")
    gets

  when 3
    slow_print("\n\e[38;5;22mThe garden feels timeless in the night.\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mDew glistens faintly on every leaf, catching the \e[1;38;5;250mmoonlight\e[38;5;22m like tiny stars.\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mThe air is still, and every sound feels amplified — a rustle, a distant chirp, your own breath.\n\e[0m")
    gets
    slow_print("\n\e[38;5;22mYou feel a quiet reverence here, as if you've entered the garden's dreams.\n\e[0m")
    gets

  else
    slow_print("\n\e[38;5;22mYou are in the garden.\n\e[0m")
    gets

  end
end

  loop do
    slow_print("\n\e[38;5;22mYou must make a choice: \n1. explore\n2. back\n3. eat\n4. sleep \n5. stay \n6. menu\n\e[0m")
    print "> "
    choice = gets.chomp.downcase

      case choice
      when "explore", "1"

        if $doors_unlocked["emerald_room"]
          slow_print("\n\e[38;5;22mYou step up to the \e[38;5;40memerald door\e[38;5;22m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;22mYou push on the door and it opens easily.\n\e[0m")
          gets
          slow_print("\n\e[38;5;22mYou step through the \e[38;5;40memerald door\e[38;5;22m.\n\e[0m")
          gets
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "emerald_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          short_load_animation
          return "emerald_room"

        elsif $inventory.include?("copper ring")
          slow_print("\n\e[38;5;22mYou place the \e[38;5;166mcopper ring\e[38;5;22m in the small circular notch in the door.\n\e[0m")
          gets
          slow_print("\n\e[38;5;22m*\e[38;5;166mcopper ring\e[38;5;22m has been removed from your bag*\n\e[0m")
          gets
          slow_print("\n\e[38;5;22mThe ring fits perfectly, and you hear a click.\n\e[0m")
          gets
          slow_print("\n\e[38;5;22mYou step through the door, into the \e[38;5;40memerald room\e[38;5;22m.\n\e[0m")
          gets
          $doors_unlocked["emerald_room"] = true # Unlock the emerald room door
          $inventory.delete("copper ring") # Remove the ring after use
          save_game("autosave") # Autosave after unlocking the door
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "emerald_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          short_load_animation
          return "emerald_room"

        else
          slow_print("\n\e[38;5;22mYou step up to the \e[38;5;40memerald\e[38;5;22m door.\n\e[0m")
          gets
          slow_print("\n\e[38;5;22mYou run your hand in the notch in the door.\n\e[0m")
          gets
          slow_print("\n\e[38;5;22mIt looks like something goes in it.\n\e[0m")
          gets
          slow_print("\n\e[38;5;22mMaybe something made of \e[38;5;166mcopper\e[38;5;22m.\n\e[0m")
          gets
          
        end

      when "back", "2"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "greenhouse", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "greenhouse"

      when "eat", "3"
        return eat("garden")

      when "sleep", "4"
        return sleep_action("garden")

      when "menu", "6"
        menu_handler
        return if $just_loaded_game # If just loaded, return to avoid changing room

      when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room

      when "stay", "5"
        times_stayed = increment_stay("garden", $day_or_night)

        if $day_or_night == "day"
          case times_stayed
          when 1
            slow_print("\n\e[38;5;22mYou take a deep breath,\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mand feel the energy of the life growing around you.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mIt feels good to be back outside.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mThe \e[1;38;5;220msun\e[38;5;22m is warm on your skin.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mThe birds are singing in the trees.\n\e[0m")
            gets

          when 2
            slow_print("\n\e[38;5;22mYou walk around the garden...\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mLooking at the flowers and plants...\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mSome appear to be completely ordinary,\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mwhile others are exotic and strange.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mA deep peace envelops you.\n\e[0m")
            gets

          when 3
            slow_print("\n\e[38;5;22mYou walk up to the \e[38;5;94mold oak tree\e[38;5;22m and lean against it...\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mYou feel the rough bark against your back.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mYou turn and put a hand on the \e[38;5;94mold oak tree\e[38;5;22m.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mYou begin to walk around the tree slowly.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mSuddenly, a small bird flies from a hole in the tree\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mThen you see the \e[1;38;5;220msunlight\e[38;5;22m reflect off something in the hole.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mYou step up to the hole and reach inside.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mYou pull out a \e[38;5;250msilver ring\e[38;5;22m.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22m*\e[38;5;250msilver ring\e[38;5;22m has been added to your bag*\n\e[0m")
            $inventory << "silver ring"
            save_game("autosave") # Autosave after finding the ring
          
          when 4
            slow_print("\n\e[38;5;22mYou feel connected to the plants in the garden.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mLike you could grow roots and stay here.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mThe plants seem to be trying to communicate with you.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mBut you don't speak plant...\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mBut you feel like you could learn.\n\e[0m")
            gets

          else
            slow_print("\n\e[38;5;22mDespite your efforts, you can't quite understand the plants.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mYou decide its time to move on.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mIf it is meant to be you will see the garden again...\n\e[0m")
            gets
            short_load_animation
            if $doors_unlocked["emerald_room"]
              $previous_room = $current_room
              $travel_log << { from: $current_room, to: "emerald_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
              return "emerald_room"

            else
              $previous_room = $current_room
              $travel_log << { from: $current_room, to: "greenhouse", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
              return "greenhouse"
            end
          end
          
        elsif $day_or_night == "night"
          case times_stayed
          when 1
            slow_print("\n\e[38;5;22mThe garden is bathed in \e[1;38;5;250mpale moonlight\e[38;5;22m.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mThe flowers seem to glow softly, their colors muted but ethereal.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mYou hear the faint rustle of leaves, though there is no wind.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mYou breathe in the cool night air...\n\e[0m")
            gets

          when 2
            slow_print("\n\e[38;5;22mYou wander among the \e[1;38;5;250mmoonlit\e[38;5;22m plants,\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mTheir shadows stretching unnaturally long.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mTiny droplets of dew catch the \e[1;38;5;250mlight\e[38;5;22m,\n\e[0m")
            gets
            slow_print("\n\e[38;5;22msparkling like scattered stars.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mYou feel as though the garden is watching you.\n\e[0m")
            gets

            when 3
            slow_print("\n\e[38;5;22mA silver-white moth drifts lazily past your face, wings catching the faint \e[1;38;5;250mlight.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mIt circles you once, then vanishes into the darkness between the trees.\n\e[0m")
            gets
            slow_print("\n\e[38;5;22mMaybe the garden sent it to guide you.\n\e[0m")
            gets

            else
            slow_print("\n\e[38;5;22mYou feel pulled to go back inside.\n\e[0m")
            gets
            short_load_animation
            if $doors_unlocked["emerald_room"]
              $previous_room = $current_room
              $travel_log << { from: $current_room, to: "emerald_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
              return "emerald_room"

            else
              $previous_room = $current_room
              $travel_log << { from: $current_room, to: "greenhouse", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
              return "greenhouse"
            end
          end


        end
      else
        slow_print("\n\e[38;5;22mThat is not a choice in this moment...\n\e[0m")
      end
  end
end