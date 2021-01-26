require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

opening # Affiche l'introduction graphique

user = HumanPlayer.new("Naruto")
player1 = Player.new("Clone #1")
player2 = Player.new("Clone #2")
player3 = Player.new("Clone #3")
player4 = Player.new("Clone #4")
# binding.pry

 while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts
  puts "#{user.show_state}"
  puts
  puts "  Quelle action veux-tu effectuer ?"
  puts
  puts "a - chercher une meilleure arme"
  puts "s - récupérer du chakra "
  puts
  puts "attaquer un joueur en vue :"
  puts "0 - #{player1.show_state}"
  puts "1 - #{player2.show_state}"
  print ">"
  action = gets.chomp.to_s
  puts
  puts
  puts "______________________________________________"
  case
  when action == "a"
    user.search_weapon
  when action == "s"
    user.search_health_pack
  when action == "0"
    user.attacks(player1)
  when action == "1"
    user.attacks(player2)
  end
  enemies = Player.enemies
  puts
  if player1.life_points || player2.life_points < 0
    puts "Les clones t'attaquent !"
  end
  puts
  enemies.each do |i|
    if i.life_points > 0
      i.attacks(user)
    end
  end
end

ending
