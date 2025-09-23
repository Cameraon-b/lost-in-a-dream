# at the top of your file (once)
require "io/console"

def eat(current_room)
  bites = 0 # track the number of *extra* bites taken
  slow_print("\nYou take out some #{$food} from your bag.\n")
  gets
  slow_print("\nYou take a bite.\n")
  gets
  slow_print("\nYou feel energized.\n")
  gets

  loop do
    slow_print("\nPress 'b' to take another bite")
    slow_print("\nPress Enter to put away the #{$food}\n")

    ch = STDIN.getch
    # Normalize Enter across platforms (CR or LF)
    ch = "\n" if ch == "\r"
    ch = ch.downcase

    case ch
    when "b"
      bites += 1
      case bites
      when 1
        slow_print("\nYou take another bite of #{$food}.\n"); gets
        slow_print("\nYou feel full.\n"); gets
      when 2
        slow_print("\nYou take another bite of #{$food}.\n"); gets
        slow_print("\nYou don't want any more.\n"); gets
        slow_print("\nYou put the #{$food} back in your bag.\n"); gets
        return current_room
      else
        slow_print("\nYou can't eat any more #{$food}.\n"); gets
        slow_print("\nYou put it away.\n"); gets
        return current_room
      end

    when "\n" # Enter pressed
      slow_print("\nYou put the #{$food} back in your bag.\n"); gets
      return current_room

    else
      slow_print("Focus on the food..."); gets
    end
  end
end

######################################################################################################################################################  
#sleep method
def sleep_action(current_room)
  slow_print("\nYour eyes get heavy...\n")
  gets
  slow_print("\nYou feel an overwhelming desire to lay down...\n")
  gets
  slow_print("\nYou fall into a deep slumber...\n")
  gets
  sleep_animation
  slow_print("\nYou wake up and feel refreshed.\n")
  gets
  slow_print("You rub your eyes and look around...\n")
  gets
    return current_room
end

########################################################################################################################################################

#sleep observatory method
def sleep_observatory(current_room)
  slow_print("\n\e[38;5;183mYou lie down on the \e[38;5;94mdark wood \e[38;5;62mdaybed\e[38;5;183m and close your eyes...\n\e[0m")
  gets
  slow_print("\n\e[38;5;183mThis has to be the most comfortable spot in the whole castle.\n\e[0m")
  gets
  slow_print("\n\e[38;5;183mYou feel your body relax as you sink into the cushions.\n\e[0m")
  gets
  slow_print("\n\e[38;5;183mYou begin to see colors and shapes swirling around you...\n\e[0m")
  gets
  slow_print("\n\e[38;5;183mYou feel a sense of weightlessness as you drift off...\n\e[0m")
  gets
  slow_print("\n\e[38;5;183mSymbols start to form but you're not sure what they are...\n\e[0m")
  gets
  slow_print("\n\e[38;5;183mSuddenly you fall into a deep sleep...\n\e[0m")
  gets
  sleep_animation
  slow_print("\n\e[38;5;183mYou are jolted awake and can't remember where you are.\n\e[0m")
  gets
  slow_print("\n\e[38;5;183mYou feel like you are late to something...\n\e[0m")
  gets
  slow_print("\n\e[38;5;183mYou take a deep breath, rub your eyes, and look around...\n\e[0m")
  gets
    return current_room
end


########################################################################################################################################################
#leave method
def leave
  slow_print("\nGoodbye for now, #{$name}\n")
  gets
  slow_print("\nDon't forget your, #{$food}\n")
  gets
  if $new_game_plus_count > 0
    slow_print("\nOh, and your #{$new_game_plus_item}.\n")
    gets
  end
  slow_print("\nAre you sure you want to leave? (y/n)\n")
  input = gets.chomp.downcase
# If the player presses enter, they leave the game.
    if input == "y" || input == "yes"
      slow_print("\nFarewell...\n")
      sleep(1.5)
      system("clear") || system("cls")
      exit(0)
# If the player types "stay", they stay in the game.
    if input == "n" || input == "no"
      slow_print("\nSo, you decided to stay...\n")
      gets
      return "main_hall"
    else
      slow_print("\nInvalid input. Please try again.\n")
      gets
      leave # Call the leave method again for another chance to input
    end
  end
end

########################################################################################################################################################
#eat ruby_room
def eat_ruby_room(current_room)
  if $inventory.include?("ruby gem")
    return eat("ruby_room")

  else
  bites = 0 #track the number of bites taken
  slow_print("\n\e[38;5;196mYou take out some #{$food} from your bag.\n\e[0m")
  gets
  slow_print("\n\e[38;5;196mYou take a bite.\n\e[0m")
  gets
  slow_print("\n\e[38;5;196mYou feel energized.\n\e[0m")
  gets

    loop do
      slow_print("\n\e[38;5;196mPress 'b' to take another bite\e[0m")
      slow_print("\n\e[38;5;196mPress Enter to put away the #{$food}\n\e[0m")

      ch = STDIN.getch
      # Normalize Enter across platforms (CR or LF)
      ch = "\n" if ch == "\r"
      ch = ch.downcase

      case ch
      when "b"
        bites += 1
        case bites
        when 1
          slow_print("\n\e[38;5;196mYou take another bite of #{$food}.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mYou feel full.\n\e[0m")
          gets

        when 2
          slow_print("\n\e[38;5;196mYou take another bite of #{$food}.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mYou bite down on something rock hard.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mYou know it's definitely not the #{$food}!\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mYou spit it out into your hand.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mYou realize it is a triangle, cut ruby gem!\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mHow did that get there? You could have choked!\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mOr chipped a tooth!.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mYour teeth hurt just thinking about it.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mYou put the #{$food} back in your bag.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mYou put the ruby gem in your bag.\n\e[0m")
          gets
          $inventory << "ruby gem"
          slow_print("\n\e[38;5;196m*ruby gem has been added to your bag*.\n\e[0m")
          gets
          save_game("autosave") # Autosave after finding the ruby gem
          return current_room

        else # This puts the food back in the bag automatically
          slow_print("\n\e[38;5;196mYou can't eat any more #{$food}.\n\e[0m")
          gets
          slow_print("\n\e[38;5;196mYou put it away.\n\e[0m")
          gets
          return current_room
        end
      


      when "\n" # this puts food back in the bag via user input
        slow_print("\n\e[38;5;196mYou put the #{$food} back in your bag.\n\e[0m")
        gets
        return current_room
      else
        slow_print("\e[38;5;196mFocus on the food...\n\e[0m")
        gets
      end
    end
  end
end

########################################################################################################################################################
#eat red_room
def eat_red_room(current_room)
  if $inventory.include?("bronze statuette")
    return eat("red_room")

  else
  bites = 0 #track the number of bites taken
  slow_print("\n\e[31mYou take out some #{$food} from your bag.\n\e[0m")
  gets
  slow_print("\n\e[31mYou take a bite.\n\e[0m")
  gets
  slow_print("\n\e[31mYou feel energized.\n\e[0m")
  gets

    loop do
      slow_print("\n\e[31mPress 'b' to take another bite\e[0m")
      slow_print("\n\e[31mPress Enter to put away the #{$food}\n\e[0m")

      ch = STDIN.getch
      # Normalize Enter across platforms (CR or LF)
      ch = "\n" if ch == "\r"
      ch = ch.downcase

      case ch
      when "b"
        bites += 1
        case bites
        when 1
          slow_print("\n\e[31mYou take another bite of #{$food}.\n\e[0m")
          gets
          slow_print("\n\e[31mYou feel full.\n\e[0m")
          gets

        when 2
          slow_print("\n\e[31mYou go to take another bite of #{$food}.\n\e[0m")
          gets
          slow_print("\n\e[31mBut instead of #{$food}, you find something else entirely.\n\e[0m")
          gets
          slow_print("\n\e[31mA \e[38;5;136mbronze statuette\e[31m in its stead.\n\e[0m")
          gets
          slow_print("\n\e[31mIt has the form of a small woman.\n\e[0m")
          gets
          slow_print("\n\e[31mBut it is missing some finer details...\n\e[0m")
          gets
          slow_print("\n\e[31mLike eyes and a mouth...\n\e[0m")
          gets
          slow_print("\n\e[31mYou check your bag and find the #{$food} safely inside.\n\e[0m")
          gets
          slow_print("\n\e[31mYou are momentarily flabbergasted.\n\e[0m")
          gets
          slow_print("\n\e[31mYou decide not to give it too much thought.\n\e[0m")
          gets
          slow_print("\n\e[31mYou put the \e[38;5;136mbronze statuette\e[31m in your bag.\n")
          gets
          $inventory << "bronze statuette"
          $easter_egg_found[:bronze_statuette] = true
          slow_print("\n\e[31m*\e[38;5;136mbronze statuette\e[31m has been added to your bag*.\n\e[0m")
          gets
          save_game("autosave") # Autosave after finding the bronze statuette
          return current_room

        else # This puts the food back in the bag automatically
          slow_print("\n\e[31mYou can't eat any more #{$food}.\n\e[0m")
          gets
          slow_print("\n\e[31mYou put it away.\n\e[0m")
          gets
          return current_room
        end
      


      when "\n" # this puts food back in the bag via user input
        slow_print("\n\e[31mYou put the #{$food} back in your bag.\n\e[0m")
        gets
        return current_room
      else
        slow_print("\n\e[31mFocus on the food...\n\e[0m")
        gets
      end
    end
  end
end

########################################################################################################################################################
def perform_ritual
  slow_print("\n\e[38;5;129mAre you sure you want to initiate the ritual?\nYou cannot go back once it begins... (y/n)\n\e[0m")
  print "> "
  confirm = gets.chomp.downcase

  if confirm != "y"
    slow_print("\n\e[38;5;129mYou step back from the sigil, uncertain...\n\e[0m")
    return "observatory"
  end

  save_game("autosave")
  slow_print("\n\e[38;5;129mYou step up to the glowing sigil, heart pounding...\n\e[0m")
  gets
  slow_print("\n\e[38;5;129mAs you stand in front of the sigil, you feel a surge of energy.\n\e[0m")
  gets
  slow_print("\n\e[38;5;129mYou instinctively know what to do...\n\e[0m")
  gets
  slow_print("\n\e[38;5;129mAlmost as if something is controlling your actions...\n\e[0m")
  gets
  slow_print("\n\e[38;5;129mYou place the \e[38;5;123mstrange device\e[38;5;129m on the top point of the pentagram...\n\e[0m")
  slow_print("\n\e[38;5;129m*\e[38;5;123mstrange device\e[38;5;129m has been removed from your bag*\n\e[0m")
  $inventory.delete("strange device")
  gets
  slow_print("\n\e[38;5;129mYou put the \e[38;5;137msandalwood incense\e[38;5;129m into the center of the pentagram...\n\e[0m")
  slow_print("\n\e[38;5;129m*\e[38;5;137msandalwood incense\e[38;5;129m has been removed from your bag*\n\e[0m")
  $inventory.delete("sandalwood_incense")
  gets
  slow_print("\n\e[38;5;129mYou take a match out of the box and \e[38;5;208mstrike it against the side...\e[38;5;129m\n\e[0m")
  slow_print("\n\e[38;5;129m*\e[38;5;208mbox of matches\e[38;5;129m has been removed from your bag*\n\e[0m")
  gets
  slow_print("\n\e[38;5;129mYou light the \e[38;5;137msandalwood incense\e[38;5;129m, filling the air with its fragrant smoke...\n\e[0m")
  $inventory.delete("box_of_matches")
  gets
  slow_print("\n\e[38;5;129mYou open the \e[38;5;198mmysterious book\e[38;5;129m and begin to read the incantation...\n\e[0m")
  slow_print("\n\e[38;5;129m*\e[38;5;198mmysterious book\e[38;5;129m has been removed from your bag*\n\e[0m")
  $inventory.delete("mysterious_book")
  gets
  really_slow_print("\n\e[38;5;198mᚨᚾᛞ ᚹᛖ ᚨᚱᛖ ᛁᚾ ᛏᚺᛖ ᛊᚺᚨᛞᛟᚹ...\n\e[0m")
  gets
  really_slow_print("\n\e[38;5;198mᛞᛖᛊᚲᛖᚾᛞ ᛏᚺᚱᛟᚢᚷᚺ ᛏᚺᛖ ᚹᛁᚾᛞᛋ...\n\e[0m")
  gets
  really_slow_print("\n\e[38;5;198mᚺᛖᚨᚱ ᛏᚺᛖ ᛋᛁᛚᛖᚾᛏ ᚲᚺᚨᚾᛏ...\n\e[0m")
  gets
  really_slow_print("\n\e[38;5;198mᛗᚨᚷᛁᚲ ᛁᛋ ᚷᚨᛚᚨ ᚨᚾᛞ ᚷᚨᛗᛖ...\n\e[0m")
  gets
  really_slow_print("\n\e[38;5;198mᚨᛇᚨ ᛋᛈᛖᚨᚳᛋ ᛏᚺᚱᚢ ᛗᛖ...\n\e[0m")
  gets


  ask_ritual_questions  # or wherever you want to send the player
end

########################################################################################################################################################
def ask_ritual_questions
  $ritual_score = 0
  responses = {}

  slow_print("\n\e[38;5;129mThe sigil shimmers with a strange light...\n\e[0m")
  gets
  slow_print("\n\e[38;5;129mYour body begins to vibrate.\n\e[0m")
  gets
  slow_print("\n\e[38;5;129mYou hear a low hum that begins to increase in pitch...\n\e[0m")
  gets
  slow_print("\n\e[38;5;129mThe hum turns into a voice that echoes in your mind...\n\e[0m")
  gets
  slow_print("\n\e[38;5;129m\"Hello, #{$name}.\"\n\e[0m")
  gets
  slow_print("\n\e[38;5;129m\"I would like to ask you a few questions.\"\n\e[0m")
  gets

  # Question 1
  slow_print("\n\e[38;5;129m\"When you are alone, what do you seek?\"\n\e[0m")
  slow_print("\n\e[38;5;244m1. Peace\n2. Power\n3. Truth\n4. Escape\e[0m\n")
  print "> "
  input = gets.chomp
  case input
  when "1"
    $ritual_score += 1
    responses[:seek] = "Peace"
  when "2"
    $ritual_score += 4
    responses[:seek] = "Power"
  when "3"
    $ritual_score += 2
    responses[:seek] = "Truth"
  when "4"
    $ritual_score += 3
    responses[:seek] = "Escape"
  end

  # Question 2
  slow_print("\n\e[38;5;129m\"What do you fear most in this life?\"\n\e[0m")
  slow_print("\n\e[38;5;244m1. Being forgotten\n2. Hurting someone you love\n3. Dying before understanding\n4. Never being truly seen\e[0m\n")
  print "> "
  input = gets.chomp
  case input
  when "1"
    $ritual_score += 3
    responses[:fear] = "Being forgotten"
  when "2"
    $ritual_score += 1
    responses[:fear] = "Hurting someone you love"
  when "3"
    $ritual_score += 4
    responses[:fear] = "Dying before understanding"
  when "4"
    $ritual_score += 2
    responses[:fear] = "Never being truly seen"
  end

  # Question 3
  slow_print("\n\e[38;5;129m\"What have you been running from?\"\n\e[0m")
  slow_print("\n\e[38;5;244m1. A memory\n2. A responsibility\n3. A feeling\n4. Yourself\e[0m\n")
  print "> "
  input = gets.chomp
  case input
  when "1"
    $ritual_score += 2
    responses[:run] = "A memory"
  when "2"
    $ritual_score += 3
    responses[:run] = "A responsibility"
  when "3"
    $ritual_score += 1
    responses[:run] = "A feeling"
  when "4"
    $ritual_score += 4
    responses[:run] = "Yourself"
  end

  # Question 4
  slow_print("\n\e[38;5;129m\"Are you ready to remember?\"\n\e[0m")
  slow_print("\n\e[38;5;244m1. Yes\n2. No\n3. I don't know\e[0m\n")
  print "> "
  input = gets.chomp
  case input
  when "1"
    $ritual_score += 2
    responses[:ready] = "Yes"
  when "2"
    $ritual_score += 0
    responses[:ready] = "No"
  when "3"
    $ritual_score += 1
    responses[:ready] = "I don't know"
  end

  # Question 5
  slow_print("\n\e[38;5;129m\"What does your heart desire most?\"\n\e[0m")
  print("> ")
  input = gets.chomp
  $new_game_plus_item = input

  slow_print("\n\e[38;5;129mThe sigil dims as the energy shifts within you...\n\e[0m")
  gets

  end_sequence
end


########################################################################################################################################################

#sleep method
def sleep_action_courtyard(current_room)
  slow_print("\n\e[38;5;153mYour eyes get heavy...\n\e[0m")
  gets
  slow_print("\n\e[38;5;153mYou feel an overwhelming desire to lay down...\n\e[0m")
  gets
  slow_print("\n\e[38;5;153mYou fall into a deep slumber...\n\e[0m")
  gets
  sleep_animation
  slow_print("\n\e[38;5;153mYou wake up and find yourself laying in the \e[38;5;107mflat plains\e[38;5;153m outside the \e[38;5;240mcastle\e[0m.\n")
  gets
  $previous_room = current_room
  $travel_log << { from: current_room, to: "outside", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
  return "outside"
end


########################################################################################################################################################

#sleep method
def sleep_action_diamond(current_room)
  slow_print("\n\e[38;5;159mYour eyes get heavy...\n\e[0m")
  gets
  slow_print("\n\e[38;5;159mYou feel an overwhelming desire to lay down...\n\e[0m")
  gets
  slow_print("\n\e[38;5;159mYou fall into a deep slumber...\n\e[0m")
  gets
  sleep_animation
  slow_print("\n\e[38;5;159mYou wake up and feel refreshed.\n\e[0m")
  gets
    return current_room
end