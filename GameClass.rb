class Game

  attr_accessor :players, :user_answer, :result

  def initialize
    @players = []
  end

  
  def get_names
    puts "Player 1, enter your name:"
    name_1 = gets.chomp
    @players << player_1 = Player.new(name_1)
    puts "Player 2, enter your name:"
    name_2 = gets.chomp
    @players << player_2 = Player.new(name_2)
  end

  def reset
    @players.each { | player | player.lives_left = 3 }
  end

  def get_answer
    @user_answer = gets.chomp.to_i
  end

  def evaluate_answer(num_1, num_2, operator)
    @result = num_1.send(operator, num_2)
    @result == @user_answer
  end

  def lose_life(current_player)
    current_player.lives_left -= 1
  end

  def life_check
    @players[0].lives_left == 0 || @players[1].lives_left == 0
  end

  def declare_winner
    if @players[0].lives_left == 0 && @players[1].lives_left == 0
      puts "It's a tie!"
    elsif @players[0].lives_left == 0
      @players[1].score += 1
      puts "#{@players[1].name} wins!!"
    else
      @players[0].score += 1
      puts "#{@players[0].name} wins!!"
    end
    puts "#{@players[0].name} #{@players[0].score}     #{@players[1].name} #{@players[1].score}"
  end

  def play_again?
    puts "Would you like to play again? Type 'yes' or 'no'."
    answer = gets.chomp
    answer == "no"
  end


end