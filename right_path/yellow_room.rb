# 1st room in the right path
#yellow room method
def yellow_room
  $ascii_yellow_room = [
    " __ __    ___  _      _       ___   __    __      ____   ___    ___   ___ ___        ",
    "|  |  |  /  _]| |    | |     /   \\ |  |__|  |    |    \\ /   \\  /   \\ |   |   |   ",
    "|  |  | /  [_ | |    | |    |     ||  |  |  |    |  D  )     ||     || _   _ |       ",
    "|  ~  ||    _]| |___ | |___ |  O  ||  |  |  |    |    /|  O  ||  O  ||  \\_/  |      ",
    "|___, ||   [_ |     ||     ||     ||  `  '  |    |    \\|     ||     ||   |   |      ",
    "|     ||     ||     ||     ||     | \\      /     |  .  \\     ||     ||   |   |     ",
    "|____/ |_____||_____||_____| \\___/   \\_/\\_/      |__|\\_|\\___/  \\___/ |___|___| "
  ]
  $ascii_yellow_room.each_with_index do |line, index|
    puts "\e[1;38;5;228m#{line}\e[0m"
  end

  $visited_rooms["yellow_room"] += 1
  visits = $visited_rooms["yellow_room"]

  case visits
  when 1
    slow_print("\n\e[38;5;228mYou find yourself in a room of bright yellow.\n\e[0m")
    gets
    slow_print("\n\e[38;5;228mThe walls are covered in yellow vinyl.\n\e[0m")
    gets
    slow_print("\n\e[38;5;228mThe floor is a soft, yellow shag carpet.\n\e[0m")
    gets
    slow_print("\n\e[38;5;228mYou feel a sense of excitement and optimism.\n\e[0m")
    gets
    slow_print("\n\e[38;5;228mYou think about the possibilities that lie ahead.\n\e[0m")
    gets
    slow_print("\n\e[38;5;228mYou notice a door on the opposite side of the room.\n\e[0m")
    gets
    slow_print("\n\e[38;5;228mIt is a wooden door painted a vibrant \e[38;5;129mpurple\e[38;5;22m.\n\e[0m")
    gets
  when 2
    slow_print("\n\e[38;5;228mYou find yourself in the yellow room again.\n\e[0m")
    gets

  else
    slow_print("\n\e[38;5;228mYou are back in the yellow room.\n\e[0m")
    gets
  end

  loop do
    slow_print("\n\e[38;5;228mYou must make a choice: \n1. explore\n2. back\n3. eat\n4. sleep\n5. stay\n6. menu\n\e[0m")
    print "> "
    choice = gets.chomp.downcase

      case choice

      when "explore", "1"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "purple_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "purple_room"

      when "back", "2"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "main_hall", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "main_hall"

      when "eat", "3"
        return eat("yellow_room")

      when "sleep", "4"
        return sleep_action("yellow_room")

      when "menu", "6"
        menu_handler
        return if $just_loaded_game # If just loaded, return to avoid changing room

      when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room

      when "stay", "5"
        $stay_counts["yellow_room"] += 1
        times_stayed = $stay_counts["yellow_room"]

        case times_stayed
        when 1
          slow_print("\n\e[38;5;228mYou look around the yellow room...\n\e[0m")
          gets
          slow_print("\n\e[38;5;228mThe brightness is energizing, almost cheerful.\n\e[0m")
          gets
          slow_print("\n\e[38;5;228mBut the longer you stay, the color presses harder against your mind.\n\e[0m")
          gets
          slow_print("\n\e[38;5;228mYou sit on the carpet.\n\e[0m")
          gets
          slow_print("\n\e[38;5;228mIt's soft, almost inviting, but the yellow glare doesn't let you rest.\n\e[0m")
          gets
          slow_print("\n\e[38;5;228mSomething taped to the wall catches your attention. A sheet of yellow paper.\n\e[0m")
          gets
          slow_print("\n\e[38;5;228mAs you approach, you see words written in shaky handwriting:\n\n")
          gets
          slow_print("\e[38;5;228m'Not all choices are clear. \nListen closely to the rooms. \nSometimes you must stay.\nThen stay again.\nUntil the truth is revealed.'\n\e[0m")
          gets

        when 2
          slow_print("\n\e[38;5;228mThe yellow glares down at you from every angle...\n\e[0m")
          gets
          slow_print("\n\e[38;5;228mThe walls seem closer than before.\n\e[0m")
          gets
          slow_print("\n\e[38;5;228mYour skin prickles, as though the color itself is touching you.\n\e[0m")
          gets
          slow_print("\n\e[38;5;228mThe paper on the wall is gone,\n\e[0m")
          gets
          slow_print("\n\e[38;5;228mbut you swear you hear a whisper repeating its words.\n\e[0m")
          gets


        when 3
          slow_print("\n\e[38;5;228mThe yellow cuts into your eyes. It refuses to let you blink without leaving ghostly afterimages.\n\e[0m")
          gets
          slow_print("\n\e[38;5;228mYour heart beats faster, and you realize you've been gripping your fists tight.\n\e[0m")
          gets
          slow_print("\n\e[38;5;228mThe carpet beneath you pulses faintly, as though it has a heartbeat.\n\e[0m")
          gets
          slow_print("\n\e[38;5;228mThe walls hum, vibrating with yellow, and the sound drills into your skull.\n\e[0m")
          gets

            
        else
          slow_print("\n\e[38;5;228mThe yellow is too much now.\n\e[0m")
          gets
          slow_print("\n\e[38;5;228mIt claws at your thoughts and you can't think of anything else.\n\e[0m")
          gets
          slow_print("\n\e[38;5;228mYour stomach churns, your head throbs.\n\e[0m")
          gets
          slow_print("\n\e[38;5;228mYou can't stay here another moment.\n\e[0m")
          gets
          slow_print("\n\e[38;5;228mThrough the glare, one thing shines clearly:\n the \e[38;5;129mpurple door\e[38;5;228m.\n\e[0m")
          gets

          short_load_animation
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "purple_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          return "purple_room"

        end

      else
      slow_print("\n\e[38;5;228mThat is not a choice in this moment...\n\e[0m")
    end
  end
end