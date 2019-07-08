require './Player'
require './Problem'
require './Round'


class Match
  def initialize
    
    p1 = new_player 1
    p2 = new_player 2
    @players = [p1, p2]
    @problems = [
      Problem.new("1 + 2", 3),
      Problem.new("3 * 4", 12),
      Problem.new("12 - 7", 5),
      Problem.new("47 + 3", 50),
      Problem.new("127 * 3", 381)
    ].shuffle!

  end

  def new_player count
    puts "Player #{count}, enter your name"
    name = gets.chomp
    Player.new name
  end


  def list_scores()
    puts "==========================="
    puts "Scores:"
    @players.each do |p|
      puts "#{p.name} => #{p.health.to_s} health"
    end
    puts "==========================="
  end

  def setup
    puts "Ready..."
    sleep 0.5
    puts "Set..."
    sleep 0.5
    puts "MATH!"
    sleep 0.5
  end

  def game_over?
    @players.select{ |player| player.health == 0}.length > 0
  end

  def play
    setup
    turn = 0
    while not game_over? do
      active_player = @players.rotate![1]
      this_problem = @problems.rotate![1]
      turn += 1
      round = Round.new(turn, active_player, this_problem)
      round.ask active_player
      list_scores
    end
    puts "#{@players.select{ |player| player.health > 0}[0].name} has won the game!"
  end
end