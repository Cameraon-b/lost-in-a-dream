# SEMI FINAL TODO: 
# need to add more comments everywhere
# needd a second stay loop if bathe > 1

#main game loop

# Necessary files
require "bundler/setup"
require 'io/console'
require 'yaml'

# Load all room files
Dir["#{__dir__}/key_rooms/*.rb"].each { |file| require_relative file }
Dir["#{__dir__}/left_path/*.rb"].each { |file| require_relative file }
Dir["#{__dir__}/middle_path/*.rb"].each { |file| require_relative file }
Dir["#{__dir__}/right_path/*.rb"].each { |file| require_relative file }
Dir["#{__dir__}/core/*.rb"].each { |file| require_relative file }

# Gradient colors for game title ascii art
gradient_colors = [135, 141, 105, 75, 117, 255]

load_animation
display_ascii_art_crawford(Ascii_lines_crawford2, Gradient_colors)


# ## modular font, Patorjks ascii art generator
# ascii_lines = [
# "___________________________________________________________",
# "___________________________________________________________",
# " ___      _______  _______  _______      ___   __    _     ",
# "|   |    |       ||       ||       |    |   | |  |  | |    ",
# "|   |    |   _   ||  _____||_     _|    |   | |   |_| |    ",
# "|   |    |  | |  || |_____   |   |      |   | |       |    ",
# "|   |___ |  |_|  ||_____  |  |   |      |   | |  _    |    ",
# "|       ||       | _____| |  |   |      |   | | | |   |    ",
# "|_______||_______||_______|  |___|      |___| |_|  |__|    ",
# " _______      ______   ______    _______  _______  __   __ ",
# "|   _   |    |      | |    _ |  |       ||   _   ||  |_|  |",
# "|  |_|  |    |  _    ||   | ||  |    ___||  |_|  ||       |",
# "|       |    | | |   ||   |_||_ |   |___ |       ||       |",
# "|       |    | |_|   ||    __  ||    ___||       ||       |",
# "|   _   |    |       ||   |  | ||   |___ |   _   || ||_|| |",
# "|__| |__|    |______| |___|  |_||_______||__| |__||_|   |_|",
# "___________________________________________________________",
# "___________________________________________________________"
# ]
# ascii_lines.each_with_index do |line, index|
#   color = gradient_colors[index % gradient_colors.length]
#   puts "\e[1;38;5;#{color}m#{line}\e[0m"
# end

## crawford2 font, Patorjks ascii art generator
# ascii_lines = [
#   "________________________________________________",
#   "________________________________________________",
#   " _       ___    _____ ______      ____  ____    ",
#   "| |     /   \\  / ___/|      |    |    ||    \\   ",
#   "| |    |     |(   \\_ |      |     |  | |  _  |  ",
#   "| |___ |  O  | \\__  ||_|  |_|     |  | |  |  |  ",
#   "|     ||     | /  \\ |  |  |       |  | |  |  |  ",
#   "|     ||     | \\    |  |  |       |  | |  |  |  ",
#   "|_____| \\___/   \\___|  |__|      |____||__|__|  ",
#   "                                                ",
#   "  ____      ___    ____     ___   ____  ___ ___ ",
#   " /    |    |   \\  |    \\   /  _] /    ||   |   |",
#   "|  o  |    |    \\ |  D  ) /  [_ /  o  || _   _ |",
#   "|     |    |  D  \\|    / |    _]|     ||  \\_/  |",
#   "|  _  |    |     ||    \\ |   [_ |  _  ||   |   |",
#   "|  |  |    |     ||  .  \\|     ||  |  ||   |   |",
#   "|__|__|    |_____||__|\\__|_____||__|__||___|___|",
#   "                                                ",
#   "________________________________________________",
#   "________________________________________________"
#   ]
# ascii_lines.each_with_index do |line, index|
#   color = gradient_colors[index % gradient_colors.length]
#   puts "\e[1;38;5;#{color}m#{line}\e[0m"
# end

$day_or_night = "day" # Set the initial time of day

slow_print("\nYou find yourself, Lost In A Dream...")
slow_print("A game by NoraTheRedeemer\n")
slow_print("Press enter to continue...")
gets


def game_loop # Main game loop for navigating rooms
  loop do
    result = case $current_room
             when "outside"        then outside
             when "main_hall"      then main_hall
             when "blue_room"      then blue_room
             when "white_room"     then white_room
             when "red_room"       then red_room
             when "grey_room"      then grey_room
             when "yellow_room"    then yellow_room
             when "purple_room"    then purple_room
             when "black_room"     then black_room
             when "brown_room"     then brown_room
             when "pink_room"      then pink_room
             when "library"        then library
             when "courtyard"      then courtyard
             when "baths"          then baths
             when "ruby_room"      then ruby_room
             when "diamond_room"   then diamond_room
             when "emerald_room"   then emerald_room
             when "attic"          then attic
             when "observatory"    then observatory
             when "greenhouse"     then greenhouse
             when "garden"         then garden
             when "forest"         then forest
             when "outside_end"    then outside_end
             else
               slow_print("Unknown place. Returning to the main hall.")
               "main_hall"
             end

             # Check if the game should end, this comes from end_credits, look for - return :end
    break if result == :end

    # Only update $current_room if we did NOT just load a save
    # This prevents overwriting the room after loading a game
    # only necessary for observatory
    unless $just_loaded_game
      $current_room = result if result.is_a?(String)
    else
      $just_loaded_game = false
    end
  end
end

# Main game loop
def main
  first_run = true
  loop do
    display_ascii_art_modular(Ascii_lines_modular, Gradient_colors) unless first_run
    first_run = false
    main_menu    # Setup for new or load
    game_loop    # Traverse rooms based on $current_room
  end
end

# Start the game
main


