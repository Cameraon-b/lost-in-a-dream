#4th room in the left path
# This method represents the library in the game.
def library
  $ascii_library = [
    " _      ____  ____   ____    ____  ____   __ __                        ",
    "| |    |    ||    \\ |    \\  /    ||    \\ |  |  |                       ",
    "| |     |  | |  o  )|  D  )|  o  ||  D  )|  |  |                       ",
    "| |___  |  | |     ||    / |     ||    / |  ~  |                       ",
    "|     | |  | |  O  ||    \\ |  _  ||    \\ |___, |                       ",
    "|     | |  | |     ||  .  \\|  |  ||  .  \\|     |                       ",
    "|_____||____||_____||__|\\_||__|__||__|\\_||____/                        ",
  ]
  $ascii_library.each_with_index do |line, index|
    puts "\e[1;38;5;138m#{line}\e[0m"
  end

  $visited_rooms["library"] += 1
  visits = $visited_rooms["library"]

  case visits
  when 1
    slow_print("\n\e[38;5;138mYou find yourself in a library.\e[0m\n")
    gets
    slow_print("\n\e[38;5;138mThe walls are lined with bookshelves, filled with books.\e[0m\n")
    gets
    slow_print("\n\e[38;5;138mThe floor is made of \e[38;5;94mdark wood\e[38;5;138m.\e[0m\n")
    gets
    slow_print("\n\e[38;5;138mIt is covered in some kind of lacquer, or resin finish. It has a shine to it.\e[0m\n")
    gets
    slow_print("\n\e[38;5;138mThe ceiling is vaulted and lined with \e[38;5;94mwooden panels\e[38;5;138m.\e[0m\n")
    gets
    slow_print("\n\e[38;5;138mA large \e[1;33mgolden chandelier\e[38;5;138m hangs in the middle.\e[0m\n")
    gets
    slow_print("\n\e[38;5;138mThere is a small \e[38;5;130mwooden table\e[38;5;138m beneath the \e[1;33mchandelier\e[38;5;138m.\e[0m\n")
    gets
    slow_print("\n\e[38;5;138mThe table is covered with a few books, some papers, and a small lamp.\e[0m\n")
    gets
    slow_print("\n\e[38;5;138mThere is a single \e[38;5;130mwooden chair\e[38;5;138m pushed up to the table.\e[0m\n")
    gets
    slow_print("\n\e[38;5;138mIn a corner there is a \e[38;5;130mwooden rocking chair\e[38;5;138m.\e[0m\n")
    gets
    slow_print("\n\e[38;5;138mYou notice a door on the opposite side of the room.\e[0m\n")
    gets
    slow_print("\n\e[38;5;138mIt is a \e[38;5;244mworn wooden door\e[38;5;138m, with a \e[38;5;220mbrass handle\e[38;5;138m.\e[0m\n")
    gets
    slow_print("\n\e[38;5;138mYou notice a missing book on the shelf next to the door.\e[0m\n")
    gets
    slow_print("\n\e[38;5;138mYou wonder why only that book is missing...\e[0m\n")
    gets
    slow_print("\n\e[38;5;138mYou feel like you should stay in this room for a bit...\e[0m\n")
    gets

  when 2
    slow_print("\n\e[38;5;138mYou find yourself in the library.\e[0m\n")
    gets

  else
    slow_print("\n\e[38;5;138mYou are in the library.\e[0m\n")
    gets
  end

  # Loop for player choices in the library
  loop do
    slow_print("\n\e[38;5;138mYou must make a choice: \n1. explore \n2. back \n3. eat \n4. sleep \n5. stay \n6. menu \n\e[0m\n")
    print "> "
    choice = gets.chomp.downcase

      case choice

      when "explore", "1"

        if $doors_unlocked["attic"]
          # Door already unlocked, simple message
          slow_print("\n\e[38;5;138mYou open the door and climb the ladder up to the attic.\e[0m\n")
          gets
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "attic", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          short_load_animation
          return "attic"

        elsif $inventory.include?("old book")
          slow_print("\n\e[38;5;138mYou approach the \e[38;5;244mworn wooden door\e[38;5;138m with the \e[38;5;220mbrass handle\e[38;5;138m.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou focus on the gap in the bookshelf just to the right of the door...\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou intuitively know the \e[38;5;180mold book\e[38;5;138m belongs there...\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou place the book in the empty space...\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mA hidden mechanism clicks, and the \e[38;5;244mworn wooden door\e[38;5;138m swings open silently.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou step through the doorway only to find a ladder.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou decide to climb the ladder.\e[0m\n")
          gets
          $inventory.delete("old book") # Remove the old book from inventory
          $doors_unlocked["attic"] = true # Mark the attic door as unlocked
          save_game("autosave") # Autosave after using the book
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "attic", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
          short_load_animation
          return "attic"

        else
          slow_print("\n\e[38;5;138mYou try the \e[38;5;244mworn wooden door\e[38;5;138m, but it won't budge.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou don't see a keyhole, it seems to be locked by some strange mechanism...\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mMaybe there's something that can help open it.\e[0m\n")
          gets
        end

      when "back", "2"
        $previous_room = $current_room
        $travel_log << { from: $current_room, to: "black_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        short_load_animation
        return "black_room"

      when "eat", "3"
        return eat("library")

      when "sleep", "4"
        return sleep_action("library")

      when "menu", "6"
        menu_handler
        return if $just_loaded_game # If just loaded, return to avoid changing room

      when "dev_tools", "~"
        new_room = dev_tools
        return new_room if new_room

      when "stay", "5"
        $stay_counts["library"] += 1
        times_stayed = $stay_counts["library"]

        case times_stayed
        when 1
          slow_print("\n\e[38;5;138mYou start scanning the shelves to see what kind of books are here.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou see books on engineering, art, and history.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mBooks on science, philosophy, and fiction.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mEncyclopedias on various subjects.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou wonder if anyone has even read some of these books.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou pull out a book titled 'Advanced Engineering'.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou flip through the pages, filled with diagrams and complex equations.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mNotes are scribbled in the margins, detailing experiments and theories.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou put the book back on the shelf...\e[0m\n")
          gets

        when 2
          slow_print("\n\e[38;5;138mYou continue to walk around the library.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou find a bunch of books on psychology, dream analysis, and the subconscious mind.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mThere has to be nearly a hundred books on these topics alone.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou pull a book of the shelf titled 'Dreams: A Journey Through the Subconscious'.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mAs you flip through the pages you read:\n'Dreams are not stories told, \nthey are corridors walked. \nEach door opened leads deeper into \nthe architecture of the self.'\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou keep flipping through the pages...\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mOne passage reads:\n'Dreams map emotion into space. \nFear becomes locked rooms, \njoy becomes glowing gardens, \nmemory becomes echoing halls.'\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou flip through some more pages\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou pause at a paragraph:\n'Dreams don't speak in words, \nbut in symbols. \nHow you react to them \nreveals more than what they mean.'\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou put the book back on the shelf, feeling a strange sense of déjà vu.\e[0m\n")
          gets

        when 3
          slow_print("\n\e[38;5;138mYou walk over to the \e[38;5;130mwooden rocking chair\e[38;5;138m...\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mIt looks very old but still sturdy.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou decide to sit down on the \e[38;5;130mwooden rocking chair\e[38;5;138m...\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou feel the urge to rock yourself back and forth.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mIt is a very comforting chair to sit in.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou decide to close your eyes and continue rocking forward and backward...\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mThe chair begins to softly creak...\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mThe creaking seems to echo in the quiet library...\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mThe creaking starts to get louder...\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou keep your eyes closed, as the creaking fills your ears...\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mThe creaking keeps getting louder...\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mSuddenly, you hear a voice whisper...\n\e[0m")
          slow_print("\n\e[38;5;138m#{$name}...\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou open your eyes and jump out of the chair.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou look around the library, but no one is there.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mMaybe it was just your imagination...\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mThat chair is pretty noisy.\e[0m\n")
          gets

        when 4
          slow_print("\n\e[38;5;138mYou decide to check out the \e[38;5;130mwooden table\e[38;5;138m in the center of the room.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mThe \e[38;5;130mtable\e[38;5;138m is old and worn, with intricate carvings on its surface.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou notice a few books scattered across the table.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou reach out to examine them more closely.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mOne of them is titled '\e[3mTraversing the Astral Planes\e[0;38;5;138m'.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mIts pages are filled with information on realms outside the physical.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mAnother book, slightly thinner, reads '\e[3mMessengers Between Worlds: Encounters with the Otherkind\e[0;38;5;138m'.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mA bookmarked page shows a sketch of a glowing, winged figure hovering above a field.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mThe third book catches your eye immediately.\n\e[0m")
          gets
          slow_print("\n\e[38;5;138mIt's a hardcover volume wrapped in \e[1;33mgold leather\e[38;5;138m.\n\e[0m")
          gets
          slow_print("\n\e[38;5;138mIt has no title on the spine, nothing on the front or back.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou gently open the cover...\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mThe inside is hollowed out.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mNestled perfectly inside is an elegant \e[1;33mgold pocket watch\e[38;5;138m, still ticking softly.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mYou pick it up, it's warm to the touch, and feels heavier than expected.\e[0m\n")
          gets
          slow_print("\n\e[38;5;138mThere's an inscription on the inside of the cover, \n\n'For #{$name}, my dearest friend.'\e[0m\n")
          gets
          slow_print("\n\e[38;5;138m*\e[1;33mgold watch\e[38;5;138m has been added to your bag*\e[0m\n")
          gets
          $inventory << "gold watch" # Add the gold watch to the inventory
          $easter_egg_found[:gold_watch] = true # Set the gold watch flag to true
          save_game("autosave") # Autosave after finding the gold watch

        else
          slow_print("\n\e[38;5;138mYou decide it is time to leave the library and its secrets behind.\e[0m\n")
          gets
          short_load_animation
          return "attic" if $doors_unlocked["attic"]
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "attic", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }

          return "black_room" # If no other options, stay in the library
          $previous_room = $current_room
          $travel_log << { from: $current_room, to: "black_room", time: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
        end

      else
      slow_print("\n\e[38;5;138mThat is not a choice in this moment...\e[0m\n")
    end
  end
end