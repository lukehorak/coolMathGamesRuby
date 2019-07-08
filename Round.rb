require './Problem'

class Round
  def initialize(roundNumber, player, problem)
    @player = player
    @roundNumber = roundNumber
    @problem = problem
  end
  
  def ask player
    puts "=====ROUND #{@roundNumber} ====="
    #ask the question
    puts "#{player.name}, it's your turn!"
    puts @problem.question
    user_answer = gets
    if (@problem.solve(user_answer.chomp.to_i))
      puts "Correct! You're good at numbers and stuff!"
    else
      puts "WRONG! YOU SUCK AT MATH"
      @player.lose_health
    end
    sleep 0.7
  end
end