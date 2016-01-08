def get_names
  puts "Player 1, enter your name:"
  @players[0][:name] = gets.chomp
  puts "Player 2, enter your name:"
  @players[1][:name] = gets.chomp
end



def ask_question
  @players.each do | current_player |
    @number_1 = rand(3..10)
    @number_2 = rand(3..10)
    puts "#{current_player[:name]}, what is #{@number_1} plus #{@number_2}?"
    @user_answer = gets.chomp.to_i
    evaluate(current_player, @number_1, @number_2)
  end
end



def evaluate(player, num_1, num_2)
  @result = num_1 + num_2
  if @result != @user_answer
    player[:score] -= 1
  end
end



def score_check
  @players[0][:score] == 0 || @players[1][:score] == 0
end



def declare_winner
  if @players[0][:score] == 0 && @players[1][:score] == 0
    puts "It's a tie!"
  elsif @players[0][:score] == 0
    puts "#{@players[1][:name]} wins!!"
  else
    puts "#{@players[0][:name]} wins!!"
  end
end



def lets_play
  get_names
  loop do
    ask_question
    break if score_check
  end
  declare_winner
end