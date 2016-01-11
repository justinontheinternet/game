require 'pry'
# require './methods'
# require './variables'
require './PlayerClass'
require './GameClass'
require './Question'

def lets_play
  game = Game.new
  game.get_names
  loop do
    game.reset
    loop do
      game.players.each do | current_player |
        question = Question.new
        question.generate_question(current_player)
        game.get_answer
        if game.evaluate_answer(question.num_1, question.num_2, question.current_operator) == false
          game.lose_life(current_player)
        end
      end
      break if game.life_check
    end
    game.declare_winner
    break if game.play_again?
  end

end



lets_play