class Problem
  attr_reader :question, :answer
  def initialize(question, answer)
    @question = question
    @answer = answer
  end

  def solve(p_answer)
    @answer == p_answer
  end
end