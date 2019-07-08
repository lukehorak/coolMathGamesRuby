class Player
  attr_accessor :health, :name

  def initialize name
    @name = name
    @health = 3
  end

  def lose_health
    @health -= 1
  end

end
