require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "------------------------------------------------"
puts "        |Bienvenue sur 'POO no Jutsu' !|         "
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts "                         @"
puts "                       @"
puts "                @ @ @"
puts "              @"
puts "            @     @ @ @"
puts "           @     @      @"
puts "           @      @     @"
puts "         @   @        @"
puts "        @ @ @ @ @ @ @"
puts 



puts "Quel est ton nom de shinobi ?"
print ">"

user = HumanPlayer.new(gets.chomp)

game

puts
puts "Bravo ! tu as gagné !"
puts
# binding.pry