def forest
# forest method
$forest_found = true
  # This is the ASCII art for the forest area patorjk.com crawford2 font
  $ascii_forest = [
" _____   ___   ____     ___  _____ ______  ",
"|     | /   \\ |    \\   /  _]/ ___/|      | ",
"|   __||     ||  D  ) /  [_(   \\_ |      | ",
"|  |_  |  O  ||    / |    _]\\__  ||_|  |_| ",
"|   _] |     ||    \\ |   [_ /  \\ |  |  |   ",
"|  |   |     ||  .  \\|     |\\    |  |  |   ",
"|__|    \\___/ |__|\\_||_____| \\___|  |__|   ",
"                                           "                                          
]
      $ascii_forest.each_with_index do |line, index|
        puts "\e[38;5;34m#{line}\e[0m"
      end
  # tracks visits for day and night separately
  visits = increment_visit("forest", $day_or_night)

# Print the description of the forest area based on the number of visits and the time of day
if $day_or_night == "day"
  case visits
  when 1
    slow_print("\n\e[38;5;34mYou awaken in an old, overgrown forest.\n\e[0m")
    gets
    slow_print("\n\e[38;5;34mThe brown room and its breathing wood are but a faint memory.\n\e[0m")
    gets
    slow_print("\n\e[38;5;34mThe forest feels alive, shades of green moving in the breeze.\n\e[0m")
    gets
    slow_print("\n\e[38;5;34mThe trees are tall and the canopy is thick, blocking out most of the \e[1;38;5;220msunlight\e[38;5;34m.\n\e[0m")
    gets
    slow_print("\n\e[38;5;34mYou can hear the sounds of wildlife all around you.\n\e[0m")
    gets
    slow_print("\n\e[38;5;34mThe air is filled with the scent of damp earth and moss.\n\e[0m")
    gets
    slow_print("\n\e[38;5;34mYou fall into a deep calm.\n\e[0m")
    gets
    slow_print("\n\e[38;5;34mYou might have gone back in time...\n\e[0m")
    gets

  when 2
    slow_print("\n\e[38;5;34mThe forest greets you with a familiar stillness.\n\e[0m")
    gets
    slow_print("\n\e[38;5;34mSomewhere high above, a branch cracks, but nothing falls.\n\e[0m")
    gets
    slow_print("\n\e[38;5;34m\e[1;38;5;220mSunlight\e[38;5;34m drips through the leaves in narrow beams, catching tiny motes of dust and pollen.\n\e[0m")
    gets
    slow_print("\n\e[38;5;34mThe trees stand with you.\n\e[0m")
    gets


  else
    slow_print("\n\e[38;5;34mYou are in the forest.\n\e[0m")
    gets
   
  end

elsif $day_or_night == "night"
  case visits

  when 1
    slow_print("\n\e[38;5;34mYou are in the forest. It's almost pitch black, the \e[38;5;255mmoonlight\e[38;5;34m hardly penetrates the thick canopy above.\n\e[0m")
    gets
    slow_print("\n\e[38;5;34mThe air is cool and still, yet every so often you hear a faint rustle in the distance.\n\e[0m")
    gets
    slow_print("\n\e[38;5;34mSomewhere above, an owl hoots — low and deliberate.\n\e[0m")
    gets


  when 2
    slow_print("\n\e[38;5;34mYou stand alone in the forest, surrounded by shadow.\n\e[0m")
    gets
    slow_print("\n\e[38;5;34mThe canopy sways in silence, blotting out most of the stars.\n\e[0m")
    gets
    slow_print("\n\e[38;5;34mA sudden snap of a twig echoes nearby, then — nothing.\n\e[0m")
    gets

    
  when 3
    slow_print("\n\e[38;5;34mYou stand alone in the forest at night, the darkness wrapping around you like a shroud.\n\e[0m")
    gets
   
  else
    slow_print("\n\e[38;5;34mYou are in the forest.\n\e[0m")
    gets
   
  end
end


# This loop allows the player to choose actions while in the forest.
  loop do
    slow_print("\n\e[38;5;34mYou must make a choice: \n1. stay \n2. sleep \n3. eat \n4. menu\n\e[0m")
    print "> "
    choice = gets.chomp.downcase

    case choice

    when "sleep", "2" # This allows the player to sleep in the forest.
      $previous_room = $current_room
      $travel_log << { from: $current_room, to: "garden", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
      return sleep_action("outside")
     
    when "eat", "3" # This allows the player to eat in the forest.
      return eat("forest")

    when "menu", "4" # This allows the player to access the main menu.
      return menu_handler

    when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room

    when "stay", "1" # This allows the player to stay which has different outcomes based on how many times they have stayed and the time of day.
      times_stayed = increment_stay("forest", $day_or_night)

      if $day_or_night == "day"
        case times_stayed
        when 1
          slow_print("\n\e[38;5;34mYou stand among towering trees, their branches swaying gently above.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mBirdsong flutters through the canopy, bright and cheerful.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mA patch of \e[1;38;5;220msunlight\e[38;5;34m warms your face.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mSomewhere nearby, \e[38;5;25mwater trickles softly\e[38;5;34m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mThe air smells of pine resin and damp soil.\n\e[0m")
          gets

        when 2
          slow_print("\n\e[1;38;5;220msunlight\e[38;5;34m filters through the canopy in shifting beams.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mDust motes dance lazily in the air.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mA woodpecker taps in the distance.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mYour eyes follow a squirrel darting up a trunk.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mThe forest feels unhurried, content to let time pass.\n\e[0m")
          gets

        when 3
          slow_print("\n\e[38;5;34mA warm breeze stirs the leaves, sending ripples of \e[1;38;5;220mlight\e[38;5;34m across the forest floor.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mThe call of a songbird echoes between the trees.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mYou notice the faint hum of insects in the undergrowth.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mThe trunks around you rise like pillars in some ancient hall.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mYou feel small, but welcome.\n\e[0m")
          gets

        when 4
          slow_print("\n\e[38;5;34mA butterfly drifts past, its wings catching the \e[1;38;5;220msunlight\e[38;5;34m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mThe canopy above sways as if whispering to itself.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mSomewhere deeper in the forest, something splashes in \e[38;5;25mwater\e[38;5;34m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mYou spot a patch of \e[38;5;226mwildflowers\e[38;5;34m swaying gently.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mTheir colors seem to glow in the \e[1;38;5;220mlight\e[38;5;34m.\n\e[0m")
          gets

        else
          slow_print("\n\e[38;5;34mThe sights and sounds of the forest begin to hypnotize you.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mYou feel yourself drifting, the world around you blurring.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mYou fall into the forest's trance.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mYour body begins to move on its own.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mIt wanders deeper into the forest.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mIt sits beneath a sprawling oak, the ancient tree's roots cradling it like a mother.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mThe forest embraces you with a gentle lullaby of rustling leaves and distant calls.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mYour eyes grow heavy, and you succumb to the lull of the forest.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mYou drift into a deep sleep, falling into the forest's embrace.\n\e[0m")
          gets
          sleep_animation
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "outside", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          return "outside"
        end

      elsif $day_or_night == "night"
        case times_stayed
        when 1
          slow_print("\n\e[38;5;34mThe forest is a lattice of deep shadow and \e[1;38;5;250msilver moonlight\e[38;5;34m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mLeaves rustle faintly somewhere above.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mAn owl calls in the distance, low and deliberate.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mThe air smells of damp moss and cool stone.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mEvery sound seems sharper, like the forest is holding its breath.\n\e[0m")
          gets

        when 2
          slow_print("\n\e[1;38;5;250mMoonlight\e[38;5;34m trickles through the leaves in pale ribbons.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mThe air feels heavier at night, thick with silence.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mA twig snaps nearby — you turn, but see only darkness.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mSomething unseen shifts in the undergrowth.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mThe sound fades, but your pulse does not.\n\e[0m")
          gets

        when 3
          slow_print("\n\e[38;5;34mYou stand still, letting your eyes adjust to the gloom.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mShapes emerge: trunks, branches, the suggestion of movement.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mThe night air is cool on your skin.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mSomewhere far away, \e[1;38;5;25mwater\e[38;5;34m laps gently against stone.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mYou wonder how far the forest reaches.\n\e[0m")
          gets

        when 4
          slow_print("\n\e[38;5;34mThe forest is quiet, too quiet.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mEven the wind seems to have left.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mYour own footsteps sound unnaturally loud.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mA chill runs down your spine.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mThe trees stand like silent watchers in the dark.\n\e[0m")
          gets

        else
          slow_print("\n\e[38;5;34mThe darkness closes in on you.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mAll you can hear is the sound of your own breathing.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mYou decide to sit down underneath a large tree.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mThe forest floor is cool and soft beneath you.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mYou close your eyes and focus on your breathing.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mIt becomes slower and deeper.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mYou feel your body and mind relax.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mYou lose all sense of the forest.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mYou lose all sense of time and space.\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mYou lose all sense of yourself...\n\e[0m")
          gets
          slow_print("\n\e[38;5;34mYou drift into a deep sleep...\n\e[0m")
          gets
          sleep_animation
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "outside", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          return "outside"
        end
      end 

    else
      slow_print("\n\e[38;5;34mThat is not a choice in this moment...\n\e[0m")
    end
  end
end