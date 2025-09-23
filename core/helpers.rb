# helpers.rb
# This file contains helper methods for printing text with various speeds and effects.
#also contains methods for displaying gem progress and handling game saves and loads.

# This method prints text slowly to create a dramatic effect.
# It adds a random delay to each character to create a more natural reading pace.
def really_slow_print(text, base_delay = 0.05, newline = true)
  text.each_char do |char|
    print char
    sleep(base_delay + rand * base_delay / 2)
  end
  puts if newline
end

#######################################################################################################################################################
# This method prints text slowly to create a dramatic effect. 0.03 slow. 0.15 fast. 0.001 really fast for dev.
# creates a new line after printing the text.
def slow_print(text, base_delay = 0.01, newline = true)
  text.each_char do |char|
    print char
    sleep(base_delay + rand * base_delay / 2)
  end
  puts if newline
end

########################################################################################################################################################
# This method prints text slowly with a shorter delay for less dramatic effect.
# Used for gradient colored text or less important messages.
# The delay is half of the slow_print delay.
def less_slow_print(text, base_delay = 0.0025, newline = true)
  text.each_char do |char|
    print char
    sleep(base_delay + rand * base_delay / 2)
  end
  puts if newline
end

########################################################################################################################################################
# This method prints text slowly with a very short delay for quick messages.
# Used for quick prompts or less important messages.
def not_slow_print(text, delay = 0.0001)
  text.each_char do |char|
    print char
    sleep(delay)
  end
  puts
end

########################################################################################################################################################
# This method prints text slowly with a shorter delay for less dramatic effect.
# Used for gradient colored text or less important messages.
# The delay is half of the slow_print delay.
def not_slow_print(text, delay = 0.00001)
  text.each_char do |char|
    print char
    sleep(delay)
  end
  puts
end

########################################################################################################################################################
# This method checks how many gems have been inserted into the gem slots.
# It counts the number of true values in the $gems_inserted hash.
def display_gem_progress
  inserted = $gems_inserted.values.count(true)
  total = $gems_inserted.size

  case inserted
  when 1
    slow_print("\n\e[38;5;183mYou hear a soft click in the distance... (1 of #{total} gems inserted)\n\e[0m")
    gets
  when 2
    slow_print("\n\e[38;5;183mAnother mechanism stirs... (2 of #{total} gems inserted)\n\e[0m")
    gets
  when 3
    slow_print("\n\e[38;5;183mA distant rumble echoes through the halls. All gems have been placed...\n\e[0m")
    gets
    slow_print("\n\e[38;5;183mThe way to the observatory is now open.\n\e[0m")
    gets
    $current_room = "observatory"
  end
end

########################################################################################################################################################

def end_sequence
  slow_print("\n\e[38;5;201mThe sigil flares with light, and the world begins to blur...\n\e[0m")
  gets

  delay = 0.25  # Initial delay (slow)

  $travel_log.reverse.each do |entry|
    flash_room(entry[:to])
    sleep(delay)
    delay *= 0.92  # Speed up gradually
    delay = 0.01 if delay < 0.01  # Minimum delay limit
  end
  clear_screen

  slow_print("\n\e[38;5;93mYou are back where you started...\n\e[0m")
  gets
  short_load_animation

  return "outside_end"
end




########################################################################################################################################################

def wake_up
  load_animation
  case $ritual_score
  when 0..5
    slow_print("\n\e[38;5;240mYour experience shifts, your eyes are closed.\n\e[0m")
    gets
    slow_print("\n\e[38;5;240mYou open them slightly to the dim outline of your bedroom.\n\e[0m")
    gets
    slow_print("\n\e[38;5;240mYour bed is cold but you are covered in sweat.\n\e[0m")
    gets
    slow_print("\n\e[38;5;240mFor a long moment, you consider if it was a dream, or something more.\n\e[0m")
    gets
    slow_print("\n\e[38;5;240mYou aren't ready to get up yet.\n\e[0m")
    gets
    slow_print("\n\e[38;5;240mYou close your eyes, and rest your head back on the pillow.\n\e[0m")
    gets

    if $easter_egg_found.values.all?
      slow_print("\n\e[38;5;240mYou lay in bed for a bit longer but you can't seem to fall back asleep.\n\e[0m")
      gets
      slow_print("\n\e[38;5;240mYou want to go back to that place, but you remember you have things to do.\n\e[0m")
      gets
      slow_print("\n\e[38;5;240mMaybe tomorrow night...\n\e[0m")
      gets
    end

  when 6..9
    slow_print("\n\e[38;5;178mYour vision fades, but the darkness never fully arrives.\n\e[0m")
    gets
    slow_print("\n\e[38;5;178mColors and shapes blur together and move around you.\n\e[0m")
    gets
    slow_print("\n\e[38;5;178mYou suddenly hear a strong wind...\n\e[0m")
    gets
    slow_print("\n\e[38;5;178mThen you begin to smell the ocean...\n\e[0m")
    gets
    slow_print("\n\e[38;5;178mYou can hear water all around you.\n\e[0m")
    gets
    slow_print("\n\e[38;5;178mThen your vision begins to sharpen...\n\e[0m")
    gets
    slow_print("\n\e[38;5;178mYou find yourself standing on a small island.\n\e[0m")
    gets
    slow_print("\n\e[38;5;178mOn the other side of the island you see a large temple.\n\e[0m")
    gets
    slow_print("\n\e[38;5;178mCovered in aquamarine tiles.\n\e[0m")
    gets

    if $easter_egg_found.values.all?
      slow_print("\n\e[38;5;240mYou hear a child call your name... #{$name}...\n\e[0m")
      gets
      slow_print("\n\e[38;5;240mYou look to your side and see a small boy looking up at you with wide eyes.\n\e[0m")
      gets
      slow_print("\n\e[38;5;240mHe smiles brightly, and you feel a sense of familiarity.\n\e[0m")
      gets
      slow_print("\n\e[38;5;240mYou are not sure but you think he is your son.\n\e[0m")
      gets
      slow_print("\n\e[38;5;240mTogether you slowly walk toward the aquamarine temple...\n\e[0m")
      gets
    end
  

  when 10..12
    slow_print("\n\e[38;5;118mYou wake in bed with a gasp, you are covered in sweat.\n\e[0m")
    gets
    slow_print("\n\e[38;5;118mYou sit up in your bed and look around your room.\n\e[0m")
    gets
    slow_print("\n\e[38;5;118mYou don't feel totally awake yet, but everything seems normal.\n\e[0m")
    gets
    slow_print("\n\e[38;5;118mThe room is dimly lit, you decide to open the curtains.\n\e[0m")
    gets
    slow_print("\n\e[38;5;118mYou walk to the window, and pull the curtains aside.\n\e[0m")
    gets
    slow_print("\n\e[38;5;118mYour stomach drops as the familiar city that is supposed to be there,\n\e[0m")
    gets
    slow_print("\n\e[38;5;118mIs nothing but \e[38;5;107mwide open plains\e[38;5;118m...\n\e[0m")
    gets

    if $easter_egg_found.values.all?
      slow_print("\n\e[38;5;240mIn the distance you can see a castle...\n\e[0m")
      gets
      slow_print("\n\e[38;5;240mIt looks familiar...\n\e[0m")
      gets
      slow_print("\n\e[38;5;240mBut you remember there was nothing at all by the castle you were in...\n\e[0m")
      gets
      slow_print("\n\e[38;5;240mYou decide to run outside...\n\e[0m")
    end

  else
    slow_print("\n\e[38;5;199mThe landscape begins to fall apart.\n\e[0m")
    gets
    slow_print("\n\e[38;5;199mThe castle seemingly vanishes into thin air.\n\e[0m")
    gets
    slow_print("\n\e[38;5;199mYou lose sense of time and space.\n\e[0m")
    gets
    slow_print("\n\e[38;5;199mYou lose sense of yourself.\n\e[0m")
    gets
    slow_print("\n\e[38;5;199mAwareness fades...\n\e[0m")
    gets
    slow_print("\n\e[38;5;199mYou become dreamless...\n\e[0m")
    gets

    if $easter_egg_found.values.all?
      slow_print("\n\e[38;5;207mYou are in a deep dreamless sleep, not ready to awaken.\n\e[0m")
      gets
      slow_print("\n\e[38;5;141mThis is the true nature of reality.\n\e[0m")
      gets
      slow_print("\n\e[38;5;141mAwareness without an object...\n\e[0m")
      gets
      slow_print("\n\e[38;5;141mIn this state you are everything...\n\e[0m")
      gets
      slow_print("\n\e[38;5;141mAnd nothing at all...\n\e[0m")
      gets
    end
  end
  if $forest_found == true
    slow_print("\n\e[38;5;34m...\n\e[0m")
    gets
    slow_print("\n\e[38;5;34m......\n\e[0m")
    gets
    slow_print("\n\e[38;5;34m............\n\e[0m")
    gets
    slow_print("\n\e[38;5;34m................................\n\e[0m")
    gets
    slow_print("\n\e[38;5;34mYou can smell the forest...\n\e[0m")
    gets
  end
  end_credits
end
########################################################################################################################################################

def clear_screen
  system("clear") || system("cls")
end

########################################################################################################################################################

def flash_room(room_name)
  key = normalize_room_name(room_name)
  info = $room_flashes[key]
  return unless info

  use_color = info[:color] && !$ascii_art[key]
  color_code = info[:color] ? "\e[38;5;#{info[:color]}m" : ""

  # Try to get ASCII art from the hash
  ascii_lines = $ascii_art[key]

  puts "\n#{color_code}"

  if ascii_lines
    ascii_lines.each { |line| puts "#{color_code}#{line}\e[0m" }
  else
    a = Artii::Base.new(font: 'smshadow')
    ascii = a.asciify(room_name.upcase)
    puts "#{color_code}#{ascii}\e[0m"
  end

  puts "\n#{color_code}#{info[:message]}\e[0m\n"
  sleep(0.05)
end



########################################################################################################################################################
$room_flashes = {
  "main_hall"     => { color: nil,     message: "Where your journey always begins." },
  "observatory"   => { color: 183,     message: "You gazed into the heavens." },
  "outside"       => { color: nil,     message: "Freedom is just a step away." },
  "attic"         => { color: 244,     message: "Dusty secrets hid among the beams." },
  "black_room"    => { color: 239,     message: "Darkness pressed in, silent and full." },
  "blue_room"     => { color: 27,      message: "Cool and deep like forgotten dreams." },
  "diamond_room"  => { color: 159,     message: "It shimmered with impossible clarity." },
  "library"       => { color: 138,     message: "The books still whisper your name." },
  "white_room"    => { color: 255,      message: "Bright, yet empty. Were you alone?" },
  "brown_room"    => { color: 180,     message: "Earthy smells and memories lingered." },
  "emerald_room"  => { color: 40,      message: "Verdant stillness pulsed with mystery." },
  "garden"        => { color: 22,      message: "Life rustled here, quiet and alive." },
  "greenhouse"    => { color: 83,      message: "Life reached for you here..." },
  "grey_room"     => { color: 245,     message: "Muted tones, heavy thoughts." },
  "red_room"      => { color: 196,      message: "Passion, fear, and fire danced here." },
  "baths"         => { color: 117,     message: "Steam curled like spirits in the mist." },
  "courtyard"     => { color: 153,     message: "Open skies, closed paths." },
  "pink_room"     => { color: 199,     message: "Softness and vulnerability met here." },
  "purple_room"   => { color: 129,     message: "Royal silence wrapped the space." },
  "ruby_room"     => { color: 196,     message: "It glowed with ancient fire." },
  "yellow_room"   => { color: 228,     message: "Brightness that buzzed with energy." }
}

########################################################################################################################################################

def end_credits
    60.times do |i|  # Increase from 10 to 30, or however many lines you want
      system("clear") || system("cls")
      puts "\n" * i + " " * (10 - i % 10) + "\e[38;5;240mLost in a dream...\e[0m"
      sleep(0.02)  # Reduce delay a bit so it doesn't feel *too* slow
    end
      system("clear") || system("cls")
      puts "\n\n\e[1;30mEverything goes dark.\n\e[0m"
      gets

    ascii_lines = [
  "________________________________________________",
  "________________________________________________",
  "                                                ",
  " _       ___    _____ ______      ____  ____    ",
  "| |     /   \\  / ___/|      |    |    ||    \\   ",
  "| |    |     |(   \\_ |      |     |  | |  _  |  ",
  "| |___ |  O  | \\__  ||_|  |_|     |  | |  |  |  ",
  "|     ||     | /  \\ |  |  |       |  | |  |  |  ",
  "|     ||     | \\    |  |  |       |  | |  |  |  ",
  "|_____| \\___/   \\___|  |__|      |____||__|__|  ",
  "                                                ",
  "  ____      ___    ____     ___   ____  ___ ___ ",
  " /    |    |   \\  |    \\   /  _] /    ||   |   |",
  "|  o  |    |    \\ |  D  ) /  [_ /  o  || _   _ |",
  "|     |    |  D  \\|    / |    _]|     ||  \\_/  |",
  "|  _  |    |     ||    \\ |   [_ |  _  ||   |   |",
  "|  |  |    |     ||  .  \\|     ||  |  ||   |   |",
  "|__|__|    |_____||__|\\__|_____||__|__||___|___|",
  "                                                ",
  "________________________________________________",
  "________________________________________________"
  ]
    ascii_lines.each_with_index do |line, index|
      less_slow_print("#{line}")
    end

    ascii_lines_two = [
  " _____             _         _    _                                   ",
  "|     |___ ___ ___| |_ ___ _| |  | |_ _ _                             ",
  "|   --|  _| -_| .'|  _| -_| . |  | . | | |                            ",
  "|_____|_| |___|__,|_| |___|___|  |___|_  |                            ",
  "                                     |___|                            ",
  "                                                                      ",
  " _____             _____ _       _____       _                        ",
  "|   | |___ ___ ___|_   _| |_ ___| __  |___ _| |___ ___ _____ ___ ___  ",
  "| | | | . |  _| .'| | | |   | -_|    -| -_| . | -_| -_|     | -_|  _| ",
  "|_|___|___|_| |__,| |_| |_|_|___|__|__|___|___|___|___|_|_|_|___|_|   "
  ]
    ascii_lines_two.each_with_index do |line, index|
      less_slow_print("#{line}")
    end

    puts "\n"
    puts "\n"
    puts "\n"
    puts "\n"

      ascii_lines_three = [
  " _ _ _     _ _   _              _        _____     _                         ",
  "| | | |___|_| |_| |_ ___ ___   |_|___   | __  |_ _| |_ _ _                   ",
  "| | | |  _| |  _|  _| -_|   |  | |   |  |    -| | | . | | |                  ",
  "|_____|_| |_|_| |_| |___|_|_|  |_|_|_|  |__|__|___|___|_  |                  ",
  "                                                      |___|                  "
  ]
    ascii_lines_three.each_with_index do |line, index|
      less_slow_print("#{line}")
    end
    puts "\n"
    puts "\n"
    puts "\n"
    puts "\n"

       ascii_lines_four = [
  " _____             _           _    _                   _                    ",
  "|     |___ ___ ___|_|___ ___ _| |  | |_ _ _    ___    _| |___ ___ ___ _____  ",
  "|-   -|   |_ -| . | |  _| -_| . |  | . | | |  | .'|  | . |  _| -_| .'|     | ",
  "|_____|_|_|___|  _|_|_| |___|___|  |___|_  |  |__,|  |___|_| |___|__,|_|_|_| ",
  "              |_|                      |___|                                "
  ]
    ascii_lines_four.each_with_index do |line, index|
      less_slow_print("#{line}")
    end
    puts "\n"
    puts "\n"
    puts "\n"
    puts "\n"

    ascii_lines_five = [
  "                                                                     ",
  " ____      _                _                        _   _           ",                        
  "|    \\ ___|_|_ _ ___ ___   | |_ _ _    ___ _____ ___| |_|_|___ ___   ",                       
  "|  |  |  _| | | | -_|   |  | . | | |  | -_|     | . |  _| | . |   |  ",                      
  "|____/|_| |_|\\_/|___|_|_|  |___|_  |  |___|_|_|_|___|_| |_|___|_|_|  ",                    
  "                               |___|                                 ",
  "                                                                     "
  ]
    ascii_lines_five.each_with_index do |line, index|
      less_slow_print("#{line}")
    end
    puts "\n"
    puts "\n"
    puts "\n"
    puts "\n"

       ascii_lines_six = [
  " _____ _                   _                                         _     _   _             ",
  "|_   _| |_ ___ ___ _ _ ___| |_    ___ _ _ _____ _____ ___ ___    ___|_|___| |_| |_ ___       ",
  "  | | |   |  _| . | | | . |   |  |_ -| | |     |     | -_|  _|  |   | | . |   |  _|_ -|_ _ _ ",
  "  |_| |_|_|_| |___|___|_  |_|_|  |___|___|_|_|_|_|_|_|___|_|    |_|_|_|_  |_|_|_| |___|_|_|_|",
  "                      |___|                                           |___|                  "
  ]
    ascii_lines_six.each_with_index do |line, index|
      less_slow_print("#{line}")
    end
    puts "\n"
    puts "\n"
    puts "\n"
    puts "\n"

    ascii_lines_seven = [
" _____                    _     _    _   _           _          _          _    ",
"|  _  |   ___ ___ ___ ___|_|___| |  | |_| |_ ___ ___| |_ ___   | |_ ___   |_|   ",
"|     |  |_ -| . | -_|  _| | .'| |  |  _|   | .'|   | '_|_ -|  |  _| . |   _    ",
"|__|__|  |___|  _|___|___|_|__,|_|  |_| |_|_|__,|_|_|_,_|___|  |_| |___|  |_|   ",
"             |_|                                                                "
  ]
    ascii_lines_seven.each_with_index do |line, index|
      less_slow_print("#{line}")
    end
    puts "\n"
    puts "\n"
    puts "\n"
    puts "\n"

    ascii_lines_eight = [
" _____                            _| |_                                                       ",
"|   __|___ ___ _ _ ___ ___ ___   |   __|                                                      ",
"|  |  |  _| .'| | |_ -| . |   |  |   __|                                                      ",
"|_____|_| |__,|_  |___|___|_|_|  |_   _|                                                      ",
"              |___|                |_|                                                        ",
"                                                                                              ",
" _____     _        _   _                  _                                                  ",
"|  _  |___|_|___   | |_| |_ ___    ___ ___| |_                                                ",
"|     |  _| | .'|  |  _|   | -_|  |  _| .'|  _|                                               ",
"|__|__|_| |_|__,|  |_| |_|_|___|  |___|__,|_|                                                 ",
"                                                                                              ",
"                                                                                              ",
"                                                                                              ",
"(:`--..___...-''``-._             |`._                                                        ",
"  ```--...--.      . `-..__      .`/ _\\                                                       ",
"            `\\     '       ```--`.    />                                                      ",
"            : :   :               `:`-'                                                       ",
"             `.:.  `.._--...___     ``--...__                                                 ",
"                ``--..,)       ```----....__,)                                                ",
"                                                                                              "
  ]
    ascii_lines_eight.each_with_index do |line, index|
      less_slow_print("#{line}")
    end
    puts "\n"
    puts "\n"
    puts "\n"
    puts "\n"

        ascii_lines_nine = [
" _____     _     _          _____                      ___ ___ ___ ___                       ",
"|     |___|_|___| |_ ___   |   __|___ _____ ___ ___   |_  |   |_  |  _|                      ",
"|  |  |  _| |_ -|   | .'|  |  |  | .'|     | -_|_ -|  |  _| | |  _|_  |                      ",
"|_____|_| |_|___|_|_|__,|  |_____|__,|_|_|_|___|___|  |___|___|___|___|                      ",
"                                                                                             ",
  ]
    ascii_lines_nine.each_with_index do |line, index|
      less_slow_print("#{line}")
    end
    puts "\n"
    puts "\n"
    puts "\n"
    puts "\n"
    slow_print("\n\e[38;5;240mThanks for playing, #{$name}!\n\e[0m")
    gets
    slow_print("\n\e[38;5;240mYour journey ends here, but the dream continues...\n\e[0m")
    gets
    timer_pause
    total = format_duration(timer_elapsed)
    slow_print("\n\e[38;5;153mTotal play time: #{total}\e[0m")
    gets
    $new_game_plus_count = ($new_game_plus_count || 0) + 1
    reset_for_new_game_plus
    $inventory << $new_game_plus_item
    save_game("autosave")
    slow_print("\n\e[38;5;240mNew Game Plus activated. Load from autosave to continue your journey.\n\e[0m")
    gets
    load_animation


  return :end
end
########################################################################################################################################################

def star_fade_animation
  stars = ["✦", "✧", "★", "☆", "✩", "✪", "✫", "✬", "✭", "✮"]
  12.times do
    system("clear") || system("cls")
    20.times { print " " * rand(50) + stars.sample + "\n" }
    sleep(0.15)
  end
  system("clear") || system("cls")
  puts "\n\n\e[1;30mYour dream ends beneath the stars.\n\e[0m"
  sleep(1.5)
  main_menu
end
########################################################################################################################################################


# def sleep_animation
#   z_colors = [240, 245, 250, 255]
#   60.times do |i|
#     system("clear") || system("cls")
#     z = "Z" * ((i % 4) + 1)
#     color = z_colors[i % z_colors.size]
#     puts "\n" * (60 - i) + " " * (60 - i % 10) + "\e[38;5;#{color}m#{z}\e[0m"
#     sleep(0.1)
#   end
# end

########################################################################################################################################################

def sleep_animation
  60.times do |i|  # Increase from 10 to 30, or however many lines you want
      system("clear") || system("cls")
      puts "\n" * i + " " * (10 - i % 10) + "\e[38;5;240mzZz\e[0m"
      sleep(0.02)  # Reduce delay a bit so it doesn't feel *too* slow
    end
  end

########################################################################################################################################################
def load_animation
  60.times do |i|
    system("clear") || system("cls")
    puts "\n" * i + " " * (10 - i % 10) + "\e[38;5;240mLost in a dream...\e[0m"
    sleep(0.02)
  end
  system("clear") || system("cls")
end

########################################################################################################################################################

def short_load_animation
  15.times do |i|
    system("clear") || system("cls")
    puts "\n" * i + " " * (10 - i % 10) + "\e[38;5;240mLost in a dream...\e[0m"
    sleep(0.02)
  end
  system("clear") || system("cls")
end

########################################################################################################################################################

def normalize_room_name(name)
  name.downcase.strip.gsub(" ", "_")
end

########################################################################################################################################################

def pulse_text(text, color_code = 123, pulses = 3)
  pulses.times do
    print "\e[2;38;5;#{color_code}m#{text}\e[0m\r"  # faint
    sleep 0.3
    print "\e[1;38;5;#{color_code}m#{text}\e[0m\r"  # bold
    sleep 0.3
  end
  puts "\e[1;38;5;#{color_code}m#{text}\e[0m" # final bright
end

########################################################################################################################################################

def increment_visit(room, time)
  $visit_counts_by_time[room] ||= { "day" => 0, "night" => 0 }
  $visit_counts_by_time[room][time] ||= 0
  $visit_counts_by_time[room][time] += 1
end

########################################################################################################################################################

def increment_stay(room, time)
  $stay_counts_by_time[room] ||= { "day" => 0, "night" => 0 }
  $stay_counts_by_time[room][time] ||= 0
  $stay_counts_by_time[room][time] += 1
end

########################################################################################################################################################

########################################################################################################################################################

def reset_for_new_game_plus
  # --- Preserve exactly what should carry over ---
  preserved_name      = $name
  preserved_food      = $food
  preserved_ngp_count = $new_game_plus_count || 0
  preserved_ngp_item  = $new_game_plus_item # keep around if you want to add it post-reset

  # --- Fresh run defaults ---
  $current_room   = "outside"
  $previous_room  = nil
  $day_or_night   = "day"

  $inventory      = []
  $chest1_opened  = false

  $visited_rooms  = Hash.new(0)
  $stay_counts    = Hash.new(0)
  $bathe_count    = Hash.new(0)
  $sleep_counts   = Hash.new(0)
  $eat_counts     = Hash.new(0)
  $explore_count  = Hash.new(0)

  $view_telescope = Hash.new(0)
  $view_desk      = Hash.new(0)
  $travel_log     = []

  $fountain_checked = false
  $forest_found     = false

  $doors_unlocked = {
    "attic"      => false,
    "baths"      => false,
    "greenhouse" => false,
  }

  $gems_inserted = {
    ruby:    false,
    diamond: false,
    emerald:false
  }

  $easter_egg_found = {
    gold_watch:         false,
    silver_necklace:    false,
    bronze_statuette:   false,
    crystal_ball:       false,
    pendulum:           false,
    mysterious_flowers: false,
  }

  $ritual_items = {
    "strange_device"    => false,
    "mysterious_book"   => false,
    "sandalwood_incense"=> false,
    "box_of_matches"    => false,
  }
  $ritual_items_collected = false
  $sigil_appeared         = false
  $ritual_ready           = false
  $ritual_score           = 0

  # Day/Night nested counters with proper defaults
  $stay_counts_by_time  = Hash.new { |h, room| h[room] = { "day" => 0, "night" => 0 } }
  $visit_counts_by_time = Hash.new { |h, room| h[room] = { "day" => 0, "night" => 0 } }

  # Per-room last bathe visit index
  $last_bathe_visit = Hash.new { |h, room| h[room] = -1 }

  # Save/load flags and timer
  $just_loaded_game = false
  $timer = {
    started_at:  Process.clock_gettime(Process::CLOCK_MONOTONIC),
    accumulated: 0.0,
    running:     true
  }

  # --- Restore preserved values ---
  $name                 = preserved_name
  $food                 = preserved_food
  $new_game_plus_count  = preserved_ngp_count
  $new_game_plus_item   = preserved_ngp_item

  # Re-add the carried food after a clean reset
  if $food && !$food.empty? && !$inventory.include?($food)
    $inventory << $food
  end
end
