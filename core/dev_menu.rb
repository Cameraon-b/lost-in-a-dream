#DEV TOOLS

# This method provides a developer command interface for testing and debugging.
# It allows the developer to access dev_inventory, dev_jump, dev_time.
def dev_tools
  puts "\n\e[1;38;5;33mDeveloper Tools\e[0m"
  puts "\nAvailable commands: \n1. add item\n2. jump to room\n3. change/view time\n4. view travel log\n5. set ritual score\n6. go to end sequence\n7. roll credits  \n8. reset room visits\n9. reset room stays \n10. reset day/night stays\n11. reset day/night visits\n12. reset view desk\n13. reset view telescope\n14. toggle flags\n15. view timer\n16. cancel\n"
  print "\ndev> "
  input = gets.chomp.downcase

  case input
  when "add item", "add_item", "1", "dev_inventory"
    dev_inventory
    return dev_tools

  when "jump to room", "dev_jump", "jump", "2"
    new_room = dev_jump
    load_animation
    return new_room

  when "change/view time", "3"
    dev_time
    return dev_tools

  when "travel log", "view travel log", "4"
    travel_log

  when "ritual score", "set ritual score", "5"
    set_ritual_score_manually
    return dev_tools

  when "end sequence", "go to end sequence", "6"
    short_load_animation
    jump_to_end_sequence
    return "outside_end"

  when "roll credits", "7"
    slow_print("\nRolling credits...\n")
    fade_out_animation
    main_menu

  when "reset room visits", "8"
    reset_room_visits($current_room)
    return $current_room

  when "reset room stays", "9"
    reset_room_stays($current_room)
    return $current_room

  when "reset day/night stays", "reset dn stays", "10"
    reset_dn_stays($current_room)
    return $current_room

  when "reset day/night visits", "reset dn visits", "11"
    reset_dn_visits($current_room)
    return $current_room

  when "reset view desk", "12"
    reset_view_desk($current_room)
    return $current_room

  when "reset view telescope", "13"
    reset_view_telescope($current_room)
    return $current_room

  when "toggle flags", "14"
    dev_flags
    return dev_tools

  when "view timer", "15"
    puts "\n[DEV] Elapsed play time: #{format_duration(timer_elapsed)}"

  when "cancel", "exit", "16"
    puts "Exiting dev menu..."
    return $current_room
  else
    puts "Unknown dev command."
    return nil
  end
end

########################################################################################################################################################
# Developer Jump Method
# This allows the developer to jump to any room in the game.
def dev_jump
  puts "\nWhich room would you like to go to?\n"
  print "dev> "
  room = gets.chomp.downcase.gsub(" ", "_") # normalize input
  if $rooms.include?(room)  # <- assumes you've defined a master room list
    slow_print("\nYou feel yourself shift...\n")
    gets
    return room
  else
    slow_print("\nThat room does not exist.\n")
    gets
    return nil
  end
end

########################################################################################################################################################
# Developer Inventory Management (add any item to bag)
def dev_inventory
  loop do
    puts "\nEnter the item you want to add to your bag:"
    print "\ndev> "
    item = gets.chomp
    $inventory << item
    puts "#{item} has been added to your bag."
    gets

    puts "\nWhat would you like to do? \n1. add item \n2. cancel"
    print "\ndev> "
    input = gets.chomp.downcase
    break unless input == "1"
  end
end

########################################################################################################################################################
# Developer Time Management (toggle or set day/night)
def dev_time
  puts "\nCurrent time: #{$day_or_night}"
  puts "\nType \n1. toggle \n2. set day \n3. set night\n4. dev tools"
  print "\ndev> "
  input = gets.chomp.downcase

  case input
  when "toggle", "1"
    $day_or_night = $day_or_night == "day" ? "night" : "day"
    puts "\nTime toggled. Now: #{$day_or_night}"
  when "set day", "2"
    $day_or_night = "day"
    puts "\nTime set to day."
  when "set night", "3"
    $day_or_night = "night"
    puts "\nTime set to night."
  when "dev tools", "4"
    dev_tools
  else
    puts "\nNo changes made."
  end
  gets
end

########################################################################################################################################################
def travel_log
  puts "\nTravel Log:\n"
  $travel_log.each_with_index do |entry, i|
    if entry.is_a?(Hash)
      puts "#{i+1}. #{entry[:from]} → #{entry[:to]} at #{entry[:time]}"
    else
      puts "#{i+1}. #{entry}"
    end
  end
  puts "\nPress enter to return to the developer menu."
  gets
  return dev_tools
end

########################################################################################################################################################

def jump_to_end_sequence

  puts "\nJumping to end sequence..."
  # Mock visited rooms
  # $travel_log = [
  #   { to: "main_hall", from: "outside", time: "2023-10-01 12:00" },
  #   { to: "observatory", from: "main_hall", time: "2023-10-01 12:05" },
  #   { to: "attic", from: "observatory", time: "2023-10-01 12:10" },
  #   { to: "black_room", from: "attic", time: "2023-10-01 12:15" },
  #   { to: "blue_room", from: "black_room", time: "2023-10-01 12:20" },
  #   { to: "main_hall", from: "outside", time: "2023-10-01 12:00" },
  #   { to: "observatory", from: "main_hall", time: "2023-10-01 12:05" },
  #   { to: "attic", from: "observatory", time: "2023-10-01 12:10" },
  #   { to: "black_room", from: "attic", time: "2023-10-01 12:15" },
  #   { to: "blue_room", from: "black_room", time: "2023-10-01 12:20" },
  #   { to: "main_hall", from: "outside", time: "2023-10-01 12:00" },
  #   { to: "observatory", from: "main_hall", time: "2023-10-01 12:05" },
  #   { to: "attic", from: "observatory", time: "2023-10-01 12:10" },
  #   { to: "black_room", from: "attic", time: "2023-10-01 12:15" },
  #   { to: "blue_room", from: "black_room", time: "2023-10-01 12:20" },
  #   { to: "main_hall", from: "outside", time: "2023-10-01 12:00" },
  #   { to: "observatory", from: "main_hall", time: "2023-10-01 12:05" },
  #   { to: "attic", from: "observatory", time: "2023-10-01 12:10" },
  #   { to: "black_room", from: "attic", time: "2023-10-01 12:15" },
  #   { to: "blue_room", from: "black_room", time: "2023-10-01 12:20" },
  

  # ]

  $ritual_score = 1             # Give max score for best ending
  $ritual_ready = true           # Make sure ritual is ready
  $ritual_items_collected = true
  $sigil_appeared = true

  result = end_sequence
  $current_room = result         # Move to outside_end
end
########################################################################################################################################################

def set_ritual_score_manually
  print "\nEnter ritual score (0–13): \n"
  print "\ndev> "
  score = gets.chomp.to_i
  if score.between?(0, 13)
    $ritual_score = score
    puts "\nRitual score set to #{score}."
    gets
  else
    puts "\nInvalid score. Must be between 0 and 13."
    gets
  end
end

########################################################################################################################################################

def reset_room_visits(room_name)
  if $visited_rooms.key?(room_name)
    $visited_rooms[room_name] = 0
    puts "\nRoom visits for #{room_name} have been reset."
  else
    puts "Nothing has changed."
  end
end

########################################################################################################################################################

def reset_room_stays(room_name)
  if $stay_counts.key?(room_name)
    $stay_counts[room_name] = 0
    puts "\nStay counts for #{room_name} have been reset."
  else
    puts "Nothing has changed."
  end
end

########################################################################################################################################################

def reset_dn_stays(room_name)
  if $stay_counts_by_time.key?(room_name)
    $stay_counts_by_time[room_name] = Hash.new(0)
    puts "\nStay counts for #{room_name} have been reset."
  else
    puts "Nothing has changed."
  end
end

########################################################################################################################################################

def reset_dn_visits(room_name)
  if $visit_counts_by_time.key?(room_name)
    $visit_counts_by_time[room_name] = Hash.new(0)
    puts "\nVisit counts for #{room_name} have been reset."
  else
    puts "Nothing has changed."
  end
end

########################################################################################################################################################

def reset_view_desk(room_name)
  if $view_desk.key?(room_name)
    $view_desk[room_name] = 0
    puts "\nView counts for #{room_name} have been reset."
  else
    puts "Nothing has changed."
  end
end

########################################################################################################################################################

def reset_view_telescope(room_name)

  if $view_telescope.key?(room_name)
    $view_telescope[room_name] = 0
    puts "\nView counts for #{room_name} have been reset."
  else
    puts "Nothing has changed."
  end
end

########################################################################################################################################################

# ---- Helpers for flag menus ----
def list_hash_flags(title, h)
  puts "\n#{title}:"
  h.keys.each_with_index do |k, i|
    val = h[k]
    key_str = k.is_a?(Symbol) ? k : k.to_s
    puts "#{i+1}. #{key_str} => #{val}"
  end
end

def pick_hash_key(h)
  print "\ndev> select key (name or number): "
  sel = gets.chomp
  # try numeric index first
  if sel =~ /^\d+$/
    idx = sel.to_i - 1
    key = h.keys[idx]
    return key if key
  end
  # fallback: name match (case-insensitive, allow spaces/underscores)
  normalized = sel.downcase.strip.gsub(" ", "_")
  h.keys.find { |k|
    (k.is_a?(Symbol) ? k.to_s : k).downcase == normalized
  }
end

def toggle_hash_key(h, key)
  return puts("Key not found.") unless key && h.key?(key)
  h[key] = !h[key]
  puts "#{key} => #{h[key]}"
end

def set_all_hash(h, value)
  h.keys.each { |k| h[k] = value }
  puts "\nSet all to #{value}."
end

def press_enter
  puts "\nPress enter to continue."
  gets
end

# ---- Single-flag menu ----
def dev_single_flags
  singles = [
    [:fountain_checked, -> { $fountain_checked }, ->(v){ $fountain_checked = v }],
    [:ritual_items_collected, -> { $ritual_items_collected }, ->(v){ $ritual_items_collected = v }],
    [:chest1_opened, -> { $chest1_opened }, ->(v){ $chest1_opened = v }],
    [:sigil_appeared, -> { $sigil_appeared }, ->(v){ $sigil_appeared = v }],
    [:ritual_ready, -> { $ritual_ready }, ->(v){ $ritual_ready = v }],
    [:just_loaded_game, -> { $just_loaded_game }, ->(v){ $just_loaded_game = v }],
    # Add more singles here if you want:
    # [:sigil_appeared, -> { $sigil_appeared }, ->(v){ $sigil_appeared = v }],
  ]

  loop do
    puts "\nSingle Flags:"
    singles.each_with_index do |(name, getter, _), i|
      puts "#{i+1}. #{name} => #{getter.call}"
    end
    puts "\n#{singles.size+1}. back"
    print "\ndev> "

    input = gets.chomp.downcase
    return if input == "back" || input == (singles.size+1).to_s

    if input =~ /^\d+$/
      idx = input.to_i - 1
      next puts "\nInvalid choice." unless singles[idx]
      name, getter, setter = singles[idx]
      setter.call(!getter.call)
      puts "#{name} => #{getter.call}"
      press_enter
    else
      puts "\nInvalid choice."
    end
  end
end

# ---- Main flag toggler ----
def dev_flags
  loop do
    puts "\nFlag Groups:"
    puts "1. doors_unlocked"
    puts "2. gems_inserted"
    puts "3. easter_egg_found"
    puts "4. ritual_items"
    puts "5. single flags (fountain_checked, ritual_items_collected, etc.)"
    puts "6. back"
    print "\ndev> "
    group = gets.chomp.downcase

    case group
    when "1", "doors", "doors_unlocked"
      dev_hash_flags("doors_unlocked", $doors_unlocked)
    when "2", "gems", "gems_inserted"
      dev_hash_flags("gems_inserted", $gems_inserted)
    when "3", "eggs", "easter_egg_found"
      dev_hash_flags("easter_egg_found", $easter_egg_found)
    when "4", "ritual", "ritual_items"
      dev_hash_flags("ritual_items", $ritual_items)
    when "5", "single", "singles"
      dev_single_flags
    when "6", "back", "exit"
      return
    else
      puts "\nInvalid choice."
    end
  end
end

def dev_hash_flags(title, h)
  loop do
    list_hash_flags(title, h)
    puts "\nActions: \n1. toggle key \n2. set all true \n3. set all false \n4. back"
    print "\ndev> "
    action = gets.chomp.downcase

    case action
    when "1", "toggle"
      key = pick_hash_key(h)
      toggle_hash_key(h, key)
      press_enter
    when "2", "all true", "true"
      set_all_hash(h, true)
      press_enter
    when "3", "all false", "false"
      set_all_hash(h, false)
      press_enter
    when "4", "back"
      return
    else
      puts "\nInvalid choice."
    end
  end
end
