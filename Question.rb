class Question

  attr_accessor :num_1, :num_2, :operators, :current_operator

  def generate_question(player)
    @num_1 = rand(3..10)
    @num_2 = rand(3..10)
    @operators = [:+, :-, :*, :/]
    @current_operator = @operators.sample
    puts "#{player.name}, what is #{@num_1} #{@current_operator.to_s} #{@num_2}?"
  end
  
end