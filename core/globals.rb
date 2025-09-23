# global variables
$name = "" # Track the player's name
$food = "" # Track the food item
$inventory = [] # Track the player's inventory
$chest1_opened = false # Track if the first chest has been opened
$visited_rooms = Hash.new(0) # Track how many times each room has been visited
$stay_counts = Hash.new(0) # Track how many times the player has stayed in each room
$bathe_count = Hash.new(0) # Track how many times the player has bathed
$sleep_counts = Hash.new(0) # Track how many times the player has slept
$eat_counts = Hash.new(0) # Track how many times the player has eaten
$view_telescope = Hash.new(0) # Track how many times the telescope has been viewed
$view_desk = Hash.new(0) # Track how many times the desk has been viewed
$fountain_checked = false # Track if the fountain has been checked
$day_or_night = "day" # Initial time of day
$previous_room = nil # Track the previous room
$ritual_items_collected = false # Track if the ritual items have been collected
$sigil_appeared = false # Track if the sigil has appeared
$ritual_ready = false # Track if the ritual is ready
$travel_log = [] # Track the player's travel history
$ritual_score = 0 # Score for the ritual completion
$explore_count = Hash.new(0) # Track how many times each room has been explored
$current_room = "main_menu" # Start in the main menu
$just_loaded_game = false # Flag to indicate if the game was just loaded
$timer = {started_at: nil, accumulated: 0.0, running: false} # Timer for the game
# Nested hash: room → { "day" => count, "night" => count }
$stay_counts_by_time = Hash.new { |h, room| h[room] = { "day" => 0, "night" => 0 } }
$visit_counts_by_time = Hash.new { |h, room| h[room] = { "day" => 0, "night" => 0 } }
$forest_found = false
$last_bathe_visit = Hash.new { |h, k| h[k] = -1 } # room => last visit index bathed
$new_game_plus_count = 0
$new_game_plus_item = ""
$previous_room_reload = nil # Track the previous room across loads


$rooms = [
  "outside", "main_hall", "blue_room", "white_room", "red_room", "grey_room",
  "yellow_room", "purple_room", "black_room", "brown_room", "pink_room",
  "library", "courtyard", "baths", "ruby_room", "diamond_room", "emerald_room",
  "attic", "observatory", "greenhouse", "garden", "outside_end", "main_menu", "forest"
]

$doors_unlocked = {
  "attic" => false,
  "baths" => false,
  "greenhouse" => false,
}
$gems_inserted = {
  ruby: false,
  diamond: false,
  emerald: false
}
$easter_egg_found = {
  gold_watch: false,
  silver_necklace: false,
  bronze_statuette: false,
  crystal_ball: false,
  pendulum: false,
  mysterious_flowers: false,
}

$ritual_items = {
  "strange_device" => false,
  "mysterious_book" => false,
  "sandalwood_incense" => false,
  "box_of_matches" => false,
}

$room_flashes = {
  "main hall"     => { color: nil,     message: "Where your journey always begins." },
  "observatory"   => { color: 183,     message: "You gazed into the heavens." },
  "outside"       => { color: nil,     message: "Freedom is just a step away." },
  "attic"         => { color: 244,     message: "Dusty secrets hid among the beams." },
  "black room"    => { color: 239,     message: "Darkness pressed in, silent and full." },
  "blue room"     => { color: 34,      message: "Cool and deep like forgotten dreams." },
  "diamond"       => { color: 159,     message: "It shimmered with impossible clarity." },
  "library"       => { color: 138,     message: "The books still whisper your name." },
  "white room"    => { color: 97,      message: "Bright, yet empty. Were you alone?" },
  "brown room"    => { color: 180,     message: "Earthy smells and memories lingered." },
  "emerald room"  => { color: 40,      message: "Verdant stillness pulsed with mystery." },
  "garden"        => { color: 22,      message: "Life rustled here, quiet and alive." },
  "greenhouse"    => { color: 83,      message: "Life reached for you here..." },
  "grey room"     => { color: 245,     message: "Muted tones, heavy thoughts." },
  "red room"      => { color: 31,      message: "Passion, fear, and fire danced here." },
  "baths"         => { color: 117,     message: "Steam curled like spirits in the mist." },
  "courtyard"     => { color: 153,     message: "Open skies, closed paths." },
  "pink room"     => { color: 199,     message: "Softness and vulnerability met here." },
  "purple room"   => { color: 129,     message: "Royal silence wrapped the space." },
  "ruby room"     => { color: 196,     message: "It glowed with ancient fire." },
  "yellow room"   => { color: 228,     message: "Brightness that buzzed with energy." },
  "forest"        => { color: 34,      message: "Whispers of the wild beckon you." }
}
