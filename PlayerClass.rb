class Player
  
  attr_accessor :name, :lives_left, :score

  def initialize(name)
    @name = name
    @lives_left = 3
    @score = 0
  end


end