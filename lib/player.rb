class Player
  attr_accessor :name, :life_points, :enemies
  @@enemies = []
  
  def initialize(name)
    @name = name
    @life_points = 10
    
    @@enemies << self
  end

  def self.enemies
    return @@enemies
  end

  def show_state
    return "#{@name} a #{@life_points} points de chacra"
  end

  def gets_damage(damage_points)
    @life_points = @life_points - damage_points
    if @life_points <= 0
      puts "le shinobi #{@name} a été tué !"
    end
  end

  def attacks(player)
    puts "le joueur #{@name} attaque le joueur #{player.name}"
    i = compute_damage
    puts "il lui inflige #{i} points de dommages"
    player.gets_damage(i)
  end

  def compute_damage
    return rand(1..6)
  end



end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    return "#{@name} a #{@life_points} points de chakra et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    if new_weapon > @weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      @weapon_level = new_weapon
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    get_health = rand(1..6)
    case
      when get_health == 1
        puts "Tu n'as rien récupéré... "
      when get_health.between?(2, 5) 
        puts "Bravo, tu as augmenté ton chakra de +50 !"
        (@life_points + 50 > 100) ? (@life_points = 100) : (@life_points = @life_points + 50)
      when get_health == 6
        puts "Waow, tu as augementé ton chakra de +80 !"
        (@life_points + 80 >= 100) ? (@life_points = 100) : (@life_points = @life_points + 80)
    end
  end

end
