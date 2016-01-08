def get_names
  puts "Player 1, enter your name:"
  name_1 = gets.chomp
  @players << player_1 = Player.new(name_1)
  puts "Player 2, enter your name:"
  name_2 = gets.chomp
  @players << player_2 = Player.new(name_2)
end



def ask_question
  @players.each do | current_player |
    @number_1 = rand(3..10)
    @number_2 = rand(3..10)
    puts "#{current_player.name}, what is #{@number_1} plus #{@number_2}?"
    @user_answer = gets.chomp.to_i
    evaluate(current_player, @number_1, @number_2)
  end
end



def evaluate(player, num_1, num_2)
  @result = num_1 + num_2
  if @result != @user_answer
    player.lives_left -= 1
  end
end



def life_check
  @players[0].lives_left == 0 || @players[1].lives_left == 0
end



def declare_winner
  if @players[0].lives_left == 0 && @players[1].lives_left == 0
    puts "It's a tie!"
  elsif @players[0].lives_left == 0
    puts "#{@players[1].name} wins!!"
  else
    puts "#{@players[0].name} wins!!"
  end
end



def lets_play
  get_names
  loop do
    ask_question
    break if life_check
  end
  declare_winner
end