#main_menu
def main_menu
  $game_state = nil
  
  loop do
    slow_print("--- Main Menu ---")
    slow_print("1. New Game")
    slow_print("2. Load Game")
    slow_print("3. Exit\n")
    print "> "
    choice = gets.chomp

    case choice
    when "1"
      $game_state = "new"
      start_new_game # Call the new game setup
      short_load_animation
      break
    when "2"
      $game_state = "load"
      short_load_animation
      break
    when "3"
      slow_print("Exiting the game. Goodbye!")
      short_load_animation
      exit
    when "dev_tools", "~"
      # If dev_tools is called from main_menu, we need to ensure the game context is set up
      # Set up necessary defaults to simulate a game context
      $name ||= "DevTester"
      $food ||= "apple"
      $inventory << $food unless $inventory.include?($food)
      $visited_rooms["outside"] ||= 0
      $stay_counts["outside"] ||= 0
      $current_room ||= "outside"
      $previous_room ||= nil
      $day_or_night ||= "day"

      new_room = dev_tools
      if new_room
        $current_room = new_room
        short_load_animation
        return  # Exit the main_menu and jump into game loop with the chosen room
      end
    else
      slow_print("Invalid choice. Please try again.")
    end
  end

  # Get player name and food preference
  case $game_state
  when "new"
    slow_print("\nWhat is your name?\n")
    print "> "
    $name = gets.chomp
    slow_print("\nHello, #{$name}\n")
    gets
    slow_print("\nWhat do you like to eat?\n")
    print "> "
    $food = gets.chomp
    $inventory << $food
    slow_print("\n*#{$food} has been added to your bag*\n")
    gets
    slow_print("\nNow let us begin...\n")
    gets
    load_animation

    $current_room = "outside" # Set the initial room to outside

  when "load"
    puts "\nLoad slots:"
    (1..3).each do |s|
      file = "saves/save_slot_#{s}.yaml"
      if File.exist?(file)
        preview = Psych.load_file(file, permitted_classes: [Time, Symbol], aliases: true)
        timestamp = preview[:timestamp] || "Unknown"
        name = preview[:name] || "???"
        room = preview[:current_room] || "???"
        ng = preview[:new_game_plus_count].to_i
        marker = ng > 0 ? " (NG+#{ng})" : " "
        puts "  #{s}. #{name} in #{room} (Saved: #{timestamp}) #{marker}"
      else
        puts "  #{s}. [Empty]"
      end
    end

    
    # Show autosave if it exists
    if File.exist?("saves/autosave.yaml")
      preview = Psych.load_file("saves/autosave.yaml", permitted_classes: [Time, Symbol], aliases: true)
      timestamp = preview[:timestamp] || "Unknown"
      name = preview[:name] || "???"
      room = preview[:current_room] || "???"
      ng = preview[:new_game_plus_count].to_i
      marker = ng > 0 ? " (NG+#{ng})" : " "
      puts "  autosave. #{name} in #{room} (Saved: #{timestamp}) #{marker}"
    end

    print "\nChoose a save slot to load:\n> "
    slot = gets.chomp

    success = load_game(slot)
    short_load_animation
    $current_room = "outside" unless success

  end
end

#######################################################################################################################################################

# This method lists the items in the player's bag
def list_inventory
  puts "\n _ - What is in my bag? - _\n"
  if $inventory.empty?
    puts "Your bag is empty.\n"
  else
    $inventory.each_with_index do |item, index|
      puts "#{index + 1}. #{item}"
    end
  end
end
########################################################################################################################################################
# This method saves the current game state to a file.
# It includes the player's name, food count, inventory, and other game state variables.
def save_game(slot)
  filename = slot == "autosave" ? "saves/autosave.yaml" : "saves/save_slot_#{slot}.yaml"
  save_data = {
    name: $name,
    food: $food,
    inventory: $inventory,
    chest1_opened: $chest1_opened,
    visited_rooms: $visited_rooms,
    stay_counts: $stay_counts,
    bathe_count: $bathe_count,
    sleep_counts: $sleep_counts,
    eat_counts: $eat_counts,
    fountain_checked: $fountain_checked,
    day_or_night: $day_or_night,
    current_room: $current_room.to_s,
    gems_inserted: $gems_inserted,
    easter_egg_found: $easter_egg_found,
    doors_unlocked: $doors_unlocked,
    previous_room: $previous_room,
    ritual_items: $ritual_items,
    ritual_items_collected: $ritual_items_collected,
    sigil_appeared: $sigil_appeared,
    ritual_ready: $ritual_ready,
    travel_log: $travel_log,
    view_telescope: $view_telescope,
    view_desk: $view_desk,
    ritual_score: $ritual_score,
    timestamp: Time.now.strftime("%Y-%m-%d %H:%M:%S"),
    timer: {accumulated: timer_elapsed.round(3)},
    visit_counts_by_time: $visit_counts_by_time,
    stay_counts_by_time: $stay_counts_by_time,
    forest_found: $forest_found,
    last_bathe_visit: $last_bathe_visit,
    new_game_plus_count: $new_game_plus_count,
    new_game_plus_item: $new_game_plus_item,
    just_loaded_game: $just_loaded_game
  }

  File.write(filename, save_data.to_yaml)
  puts "\nGame saved to slot #{slot} at #{save_data[:timestamp]}."
  puts "\n[Autosave] Game saved to autosave.yaml.\n" if slot == "autosave"
  puts "\n"
end

########################################################################################################################################################
#loads the game state from a file
# This method loads the game state from a file.
# It retrieves the player's name, food count, inventory, and other game state variables.
def load_game(slot)
  filename = slot == "autosave" ? "saves/autosave.yaml" : "saves/save_slot_#{slot}.yaml"

  if File.exist?(filename)
    save_data = Psych.load_file(filename, permitted_classes: [Time, Symbol], aliases: true)

    $name              = save_data[:name]
    $food              = save_data[:food]
    $inventory         = save_data[:inventory]
    $chest1_opened     = save_data[:chest1_opened]
    $fountain_checked  = save_data[:fountain_checked]
    $day_or_night      = save_data[:day_or_night]
    $current_room      = save_data[:current_room].to_s
    $gems_inserted     = save_data[:gems_inserted]
    $easter_egg_found  = save_data[:easter_egg_found]
    $doors_unlocked    = save_data[:doors_unlocked] || {}
    $previous_room     = save_data[:previous_room]
    $ritual_items      = save_data[:ritual_items] || {}
    $ritual_items_collected = save_data[:ritual_items_collected] || false
    $sigil_appeared    = save_data[:sigil_appeared] || false
    $ritual_ready      = save_data[:ritual_ready] || false
    $travel_log        = save_data[:travel_log] || []
    $ritual_score      = save_data[:ritual_score] || 0
    $forest_found      = save_data[:forest_found] || false
    $new_game_plus_count = save_data[:new_game_plus_count] || 0
    $new_game_plus_item = save_data[:new_game_plus_item] || ""
    $just_loaded_game = save_data[:just_loaded_game] || false

    # Ensure hashes work with default values after loading
    $view_telescope = Hash.new(0).merge(save_data[:view_telescope] || {})
    $view_desk = Hash.new(0).merge(save_data[:view_desk] || {})
    $visited_rooms = Hash.new(0).merge(save_data[:visited_rooms] || {})
    $stay_counts   = Hash.new(0).merge(save_data[:stay_counts]   || {})
    $bathe_count   = Hash.new(0).merge(save_data[:bathe_count]   || {})
    $sleep_counts  = Hash.new(0).merge(save_data[:sleep_counts]  || {})
    $eat_counts    = Hash.new(0).merge(save_data[:eat_counts]    || {})
    $visit_counts_by_time = Hash.new { |h, k| h[k] = Hash.new(0) }.merge(save_data[:visit_counts_by_time] || {})
    $stay_counts_by_time = Hash.new { |h, k| h[k] = Hash.new(0) }.merge(save_data[:stay_counts_by_time] || {})
    $last_bathe_visit = Hash.new { |h, k| h[k] = -1 } .merge(save_data[:last_bathe_visit] || {})

    acc = (save_data.dig(:timer, :accumulated) || 0.0).to_f
    $timer = {
      started_at: Process.clock_gettime(Process::CLOCK_MONOTONIC),
      accumulated: acc,
      running: true
    }

    slow_print("\nLoaded game from slot #{slot}!")
    slow_print("Save time: #{save_data[:timestamp]}") if save_data[:timestamp]
    $just_loaded_game = true # Flag to indicate a successful load
    short_load_animation
    return true
  else
    slow_print("\nNo save found in slot #{slot}.")
    slow_print("\nStarting a new game...")
    gets
    short_load_animation
    return false
  end
  true
end

########################################################################################################################################################
# This method handles the menu options for viewing inventory, saving, loading, and exiting the game.
def menu_handler
  loop do
    slow_print("\n--- Menu ---")
    slow_print("1. Inventory")
    slow_print("2. Save Game")
    slow_print("3. Load Game")
    slow_print("4. Leave Game")
    slow_print("5. Return to Game\n")
    print "\n> "
    choice = gets.chomp.downcase

    case choice

      # This case handles the player's choice to view their inventory.
      when "1", "inventory"
        list_inventory
        slow_print("\nPress Enter to return to the menu.\n")
        gets

      # This case handles the player's choice to save the game.
      # It prompts the player to choose a save slot and confirms before saving.
      when "2", "save"
        puts "\nSave slots:"
        (1..3).each do |s|
        file = "saves/save_slot_#{s}.yaml"
        if File.exist?(file)
          preview = Psych.load_file(file, permitted_classes: [Time, Symbol], aliases: true) # ✅ Fix here

          timestamp = preview[:timestamp] || "Unknown"
          name = preview[:name] || "???"
          room = preview[:current_room] || "???"
          ng = preview[:new_game_plus_count].to_i
          marker = ng > 0 ? " (NG+#{ng})" : " "
          puts "  #{s}. #{name} in #{room} (Saved: #{timestamp}) #{marker}"
        else
          puts "  #{s}. [Empty]"
        end
      end

      # Prompts the player to choose a save slot and confirms before saving.
      puts "\nChoose save slot (1-3): "
      print "> "
      slot = gets.chomp
      if File.exist?("saves/save_slot_#{slot}.yaml")
        puts "\nThis will overwrite the existing save. Continue? (y/n): "
        print "> "
        confirm = gets.chomp.downcase
        next unless confirm == 'y'
      end
      save_game(slot)

      # This case handles the player's choice to load a game.
      # It prompts the player to choose a save slot and loads the game state from that slot
    when "3", "load"
      puts "\nSave slots:"
      (1..3).each do |s|
        file = "saves/save_slot_#{s}.yaml"
        if File.exist?(file)
          preview = Psych.load_file(file, permitted_classes: [Time, Symbol], aliases: true)
          timestamp = preview[:timestamp] || "Unknown"
          name = preview[:name] || "???"
          room = preview[:current_room] || "???"
          ng = preview[:new_game_plus_count].to_i
          marker = ng > 0 ? " (NG+#{ng})" : " "
          puts "  #{s}. #{name} in #{room} (Saved: #{timestamp}) #{marker}"
        else
          puts "  #{s}. [Empty]"
        end
      end

      # Show autosave if available
      if File.exist?("saves/autosave.yaml")
        preview = Psych.load_file("saves/autosave.yaml", permitted_classes: [Time, Symbol], aliases: true)
        timestamp = preview[:timestamp] || "Unknown"
        name = preview[:name] || "???"
        room = preview[:current_room] || "???"
        ng = preview[:new_game_plus_count].to_i
        marker = ng > 0 ? " (NG+#{ng})" : " "
        puts "  autosave. #{name} in #{room} (Saved: #{timestamp}) #{marker}"
      end

      puts "\nChoose save slot (1-3 or autosave): "
      slot = gets.chomp

      if load_game(slot)
        $just_loaded_game = true       # ✅ set the flag
        return                         # ✅ immediately return to exit the current room
      else
        puts "Failed to load game."
      end


      # This case handles the player's choice to leave the game.
      # It prompts the player to confirm before exiting.
    when "4", "exit", "quit"
      leave

      # This case handles the player's choice to return to the game.
    when "5", "return", ""
      return $current_room

    when "dev_tools"
      dev_tools
      next # re-prompt after dev tools

    else
      slow_print("Invalid option. Try again.")
    end
  end
end
