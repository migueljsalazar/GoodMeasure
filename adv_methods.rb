module GameMethods
# creates an empty array for the user's inventory
class Game

#intializes the inventory variable
def initialize
@inventory = []
end

#prints the graphic screen
def graphic
  puts `clear`

  puts """
     0000             0000        7777777777777777/========___________
   00000000         00000000      7777^^^^^^^7777/ || ||   ___________
  000    000       000    000     777       7777/=========//
 000      000     000      000             7777// ((     //
0000      0000   0000      0000           7777//   \\   //
0000      0000   0000      0000          7777//========//
0000      0000   0000      0000         7777
0000      0000   0000      0000        7777
 000      000     000      000        7777
  000    000       000    000       77777
   00000000         00000000       7777777
     0000             0000        777777777"""
     sleep(2.5)
     puts `clear`
     start()
   end


# this is the command prompt method
def prompt()
  puts "\n"
  puts "What's Bond gonna do? > "
  puts "*" * 80
end

# exits the game
def quit()
  Process.exit
end

# shows a list of viable commands when a user enters "help" at the command prompt
def help()
  puts "Type the below to progress through the game. DONT BE A FUNNYGUY."
  puts "Move: go right, go left, go down, continue, back."
  puts "open: open doors, drawers, your heart, etc."
  puts "look: re-print the room description."
  puts "take: add that find to your inventory! This guy!"
  puts "use: put that item to work!"
  puts "inventory: check what you're packing."
  puts "quit: I don't blame you"
end

# shows a user's items when he enters "inventory" at the command prompt
def inventory()
  puts "This is what you got:" 
  puts @inventory
end

# this method is called if a player f**ks up to restart
def dead
  puts "You have died. Perhaps that wasn't the wisest course of action?"
  puts "Would you like to try again?"
  
  while true
    prompt; next_move = gets.chomp
    
    if next_move == "yes"
      start()
    elsif next_move == "no"
      Process.exit
    else puts "Come on, man! Get it right! This is the last time!"
    end
  end
end

def start
  puts `clear`
  puts "You've dropped in from the airvents."
  puts "You aren't sure where you are in the enemy base."
  puts "Your mission is to escape and get away with those Master Codes."
  puts "You're Bond, James Bond. It shouldn't be a problem no? Still, type: help."
  start_room()
end

# the following methods define various rooms in the game
def start_room
  puts "\n"
  puts "*" * 80
  puts "The room sees like a generic offic space. Not much to do here."
  puts "There are three doors leading out of here. Left, right, and straight ahead."
  puts "What do you do?"
  @door_unlocked = false
  while true
    prompt; next_move = gets.chomp
    if next_move == "help"
      help; prompt; next_move = gets.chomp
    end
    if next_move == "inventory"
       inventory; prompt; next_move = gets.chomp
    end
    if next_move == "quit"
      quit; 
    end
    if next_move == "look"
     puts "The room sees like a generic offic space. Not much to do here."
     puts "There are three doors leading out of here. Left, right, and straight ahead."
     puts "What do you do?"
    elsif next_move == "go left"
      keycard_room()
    elsif next_move == "continue"
      secretary_room()
    elsif @keycard_present and next_move == "use keycard"
      puts "The keycard works! The door unlocks! Now go through!"
      @door_unlocked = true
    elsif !@door_unlocked and next_move == "go right"
      puts "This door is locked."
      puts "You'll need to find some way of opening it before you can enter."
    elsif @door_unlocked and next_move == "go right"
      closet_room()
    else 
      puts "Come on, man! Get it right! This is the last time!"
    end
  end
end

def keycard_room
  if @keycard_present
    puts "Why are you still here!!"
    
  elsif !@keycard_present
    puts "You are an in even more depressing office."
    puts "Who would work here?! Anyways, there's a desk with a shiny drawer that looks useful."
    puts "What do you do?"
    @desk_open = false
    @keycard_present = false
  end

  while true
    prompt; next_move = gets.chomp
    
    if next_move == "help"
      help; prompt; next_move = gets.chomp
    end
    if next_move == "inventory"
      inventory; prompt; next_move = gets.chomp
    end
    if next_move == "quit"
      quit; 
    end
    if next_move == "look"
      puts "You are in an even more depressing office."
      puts "Who would work here?! Anyways, there's a desk with a shiny drawer that looks useful."
      puts "What do you do?"
    elsif !@desk_open and !@keycard_present and next_move == "open drawer"
      puts "Inside the drawer, you see what looks like an even MORE useful keycard! "
      @desk_open = true
    elsif @desk_open and !@keycard_present and next_move == "take keycard"
      puts "You take the keycard and slip it into your tux pocket. Should head back."
      @keycard_present = true
      @inventory << "Keycard"
    elsif next_move == "back"
      start_room()
    else puts "Come on, man! Get it right! This is the last time!"
    end
  end
end

def closet_room
    puts "This seems to be a room dedicated to a bunch of closet lockers."
    puts "You should check them. And look, a uniform on the ground!"
  @uniform_present = false
  @closet_opened = false
  @grenade_present = false

  while true
    prompt; next_move = gets.chomp
    if next_move == "help"
      help; prompt; next_move = gets.chomp
    end
    if next_move == "inventory"
       inventory; prompt; next_move = gets.chomp
    end
    if next_move == "quit"
      quit; 
    end
    
    if !@uniform_present and !@closet_opened and next_move == "look"
      puts "This seems to be a room dedicated to a bunch of closet lockers."
      puts "You should check them. And look, a uniform on the ground!"
    elsif !@uniform_present and !@closet_opened and next_move == "look"
      puts "This seems to be a room dedicated to a bunch of closet lockers."
      puts "You should check them. And look, a uniform on the ground!"
    elsif @uniform_present and @closet_opened and next_move == "look"
      puts "This seems to be a room dedicated to a bunch of closet lockers."
      puts "You should check them. And look, a uniform on the ground!"
    elsif !@uniform_present and @closet_opened and next_move == "look"
      puts "This seems to be a room dedicated to a bunch of closet lockers."
      puts "You should check them. And look, a uniform on the ground!"
    elsif !@uniform_present and next_move == "take uniform"
      puts "You grab the uniform and put it on."
      puts "In order to change to it, you'll have to \"use\" it though."
      @uniform_present = true
      @inventory << "Uniform"
    elsif !@closet_opened and next_move.include? "open" and next_move.include? "closet"
      puts "You open the closet!"
      puts "Oh, look! A grenade! Take it, take it!"
      @closet_opened = true
    elsif @closet_opened and !@grenade_present and next_move == "take grenade"
      puts "You swoop that grenade up. Still looks good"
      puts "You stuff in your pocket. Not sure if that's safe..."
      @grenade_present = true
      @inventory << "Grenade"
    elsif next_move == "back"
        start_room()
    else puts "Come on, man! Get it right! This is the last time!"
    end
  end
end

def secretary_room
  puts "Finally, a nice room! There's a secretary to the right behind her desk."
  puts "Directly in front of you, are two sliding glass doors that only open with the secretary's push of a button."
  puts "That uniform might disguise you. But what do I know?"
  @glass_doors_open = false
  
  while true
    prompt; next_move = gets.chomp
    
    if next_move == "help"
      help; prompt; next_move = gets.chomp
    end
    if next_move == "inventory"
       inventory; prompt; next_move = gets.chomp
    end
    if next_move == "quit"
      quit; 
    end
    if !@glass_doors_open and next_move == "look"
     puts "Finally, a nice room! There's a secretary to the right behind her desk."
     puts "Directly in front of you, are two sliding glass doors that only open with the secretary's push of a button."
     puts "That uniform might disguise you. But what do I know?"
    elsif @uniform_present and next_move == "use uniform"
      puts "You superman-change into the uniform. You're in full disguise!"
      puts "You walk past the secretary and she salutes you, pressing a button."
      puts "The glass doors slide open. You're in the clear! Continue!"
      @glass_doors_open = true
      @inventory.delete("Uniform")
    elsif !@glass_doors_open and next_move == "continue"
      puts "The secretary sounds the alarm! You're done! START ALL OVER."
      player_dead()
    elsif next_move == "continue" and @glass_doors_open
      hallway_room()
      Process.exit(0)
    elsif next_move == "back"
      start_room()
    else puts "Come on, man! Get it right! This is the last time!"
    end
  end
end

def hallway_room
  puts "You seem to be in a wide hallway."
  puts "There's a door to your right. And a group of soldiers in the distance."
  puts "For some reason they can't see you. But know that you're officiall in, it's time to find those Master Codes!"
  @soldiers_dead = false
  
  while true
    prompt; next_move = gets.chomp
    
    if next_move == "help"
      help; prompt; next_move = gets.chomp
    end
    if next_move == "inventory"
       inventory; prompt; next_move = gets.chomp
    end
    if next_move == "quit"
      quit; 
    end
    if next_move == "look"
      puts "You seem to be in a wide hallway."
      puts "There's a door to your right. And a group of soldiers in the distance."
      puts "For some reason they can't see you. But know that you're officiall in, it's time to find those Master Codes!"
      elsif next_move == "go right"
        before_file_room()
      elsif next_move == "go back"
        secretary_room()
      elsif @grenade_present and next_move == "use grenade"
        puts "BOOM"
        puts "All the soldiers are dead."
        puts "They all lie dead on the floor. As they fell, a door appeared behind them."
        puts "That looks like the door to go through. Hint: Make sure you check the other room first."
        @soldiers_dead = true
        @inventory.delete("Grenade")
      elsif !@soldiers_dead and next_move == "continue"
        puts "You just walked into a group of soldiers! They shot you!"
        puts "You."
        puts "Are."
        puts "Dead."
        player_dead()
      elsif @soldiers_dead and next_move == "continue"
        master_room()
      else puts "Come on, man! Get it right! This is the last time!"
    end
  end
end

def before_file_room
  puts "You see a flight of stairs going down. And very suspicious looking switch."
  @switch_pressed = false
  while true
    prompt; next_move = gets.chomp
    
    if next_move == "help"
      help; prompt; next_move = gets.chomp
    end
    if next_move == "inventory"
       inventory; prompt; next_move = gets.chomp
    end
    if next_move == "quit"
      quit; 
    end
    if next_move == "look"
      puts "You see a flight of stairs going down and very suspicious looking switch. \"press\" it!"
    elsif next_move == "press switch"
      puts "You reach out and press the small switch."
      puts "You hear something slide into position."
      @switch_pressed = true
    elsif !@switch_pressed and next_move == "go down"
      puts "You didn't press that switch! One of the steps was false!"
      puts "You fall to a quick death. START OVER."
      player_dead()
    elsif @switch_pressed and next_move == "go down"
      file_room()
    elsif next_move == "back"
      hallway_room()
    else puts "Come on, man! Get it right! This is the last time!"
    end
  end
end

def file_room()
  puts "You go down stairs."
  puts "You arrive at a file room so big, you can't see the walls. Just rows of cabinets."
  puts "There's a file in front you though, with big red letters that read: MASTER CODES. Hmmm."
  @master_codes_present = false
  while true
    prompt; next_move = gets.chomp

    if next_move == "help"
      help; prompt; next_move = gets.chomp
    end
    if next_move == "inventory"
       inventory; prompt; next_move = gets.chomp
    end
    if next_move == "quit"
      quit; 
    end
    if next_move == "look"
      puts "You go down stairs."
      puts "You arrive at a file room so big, you can't see the walls. Just rows of cabinets."
      puts "There's a dossier in front you though, with big red letters that read: MASTER CODES. Hmmm."
    elsif next_move == "take master codes"
      puts "You grab the file. Finally you have the Master Codes!"
      @master_codes_present = true
      @inventory << "Master Codes"
    elsif next_move == "back"
      before_file_room()
    else puts "Come on, man! Get it right! This is the last time!"
    end
  end
end

def master_room
  puts "This seems to be the Master Room!. There's a computer hooked up to steel door. With an exit sign ontop."
  puts "We're close! But wait... There's a dead double-o agent on the floor. That sucks! But he had a gun! Should grab it."
  puts "I guess your supposed to do something with the computer? It says \"ENTER PASSWORD. HINT: MASTER C***S\""
  @gun_present = false
  @master_codes_used = false
  while true
    prompt; next_move = gets.chomp
    
    if next_move == "help"
      help; prompt; next_move = gets.chomp
    end
    if next_move == "inventory"
       inventory; prompt; next_move = gets.chomp
    end
    if next_move == "quit"
      quit; 
    end
    if next_move == "look"
      puts "This seems to be the Master Room!. There's a computer hooked up to steel door. With an exit sign ontop."
      puts "We're close! But wait... There's a dead double-o agent on the floor. That sucks! But he had a gun! Should grab it."
      puts "I guess your supposed to do something with the computer?"
    elsif next_move == "take gun"
      puts "You grab the gun. Now you're strapped! But you do kinda feel like a dick."
      @gun_present = true
      @inventory << "Gun"
    elsif next_move == "use master codes"
      puts "The computer screen changes. Up pops \"GREAT SUCCESS\". The steel door swings open."
      @master_codes_used = true
    elsif @master_codes_used and next_move == "continue"
      last_room()
    elsif next_move == "back"
      hallway_room()
    end
  end
end

def last_room
  puts "You went past the exit... But the game isn't done. What...?"
  puts "A guard stands in front of you, with his back facing you."
  puts "Ohhhhhh. That's what the gun's for."
  @guard_dead = false
  while true
    prompt; next_move = gets.chomp
    
    if next_move == "help"
      help; prompt; next_move = gets.chomp
    end
    if next_move == "inventory"
       inventory; prompt; next_move = gets.chomp
    end
    if next_move == "quit"
      quit; 
    end
    if !@guard_dead and next_move == "look"
      puts "You went past the exit... But the game isn't done. What...?"
      puts "A guard stands in front of you, with his back facing you."
      puts "Ohhhhhh. That's what the gun's for."
    elsif @guard_dead and next_move == "look"
      puts "FINISH THE GAME. PLEASE. FOR ME."
    elsif @gun_present and next_move == "use gun" or next_move == "attack"
      puts "You kill dat mofo."
      @guard_dead = true
    elsif !@gun_present and next_move == "use gun" or next_move == "attack"
      puts "With what are you trying to kill him? Should've picked up that gone."
      puts "The guard turns around, and HE HAS A GUN. So he kills you."
      puts "START OVER."
      player_dead()
    elsif !@guard_dead and next_move == "continue"
      puts "The guard obviously sees you! He shoots. You're dead."
      puts "START OVER."
      player_dead()
    elsif @guard_dead and next_move == "continue"
      puts "You're out of there."
      puts "CONGRATS!"
      puts `clear`

  puts """
     0000             0000        7777777777777777/========___________
   00000000         00000000      7777^^^^^^^7777/ || ||   ___________
  000    000       000    000     777       7777/=========//
 000      000     000      000             7777// ((     //
0000      0000   0000      0000           7777//   \\   //
0000      0000   0000      0000          7777//========//
0000      0000   0000      0000         7777
0000      0000   0000      0000        7777
 000      000     000      000        7777
  000    000       000    000       77777
   00000000         00000000       7777777
     0000             0000        777777777"""
     sleep(4)
     puts `clear`
      Process.exit
    elsif next_move == "back"
      master_room()
    end
  end
end
end
end