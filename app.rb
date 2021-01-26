require 'bundler'
Bundler.require

# require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Romain")
player2 = Player.new("Caro")

while player1.life_points > 0 && player2.life_points > 0
  puts "Voici l'état de chaque joueur :"
  puts player1.show_state
  puts player2.show_state
  puts
  puts "Passons à la phase d'attaque :"
  player2.attacks(player1)
  break if player1.life_points < 0
  player1.attacks(player2)
  puts

end
puts
# binding.pry