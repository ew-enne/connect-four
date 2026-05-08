class Game

  def initialize
    @current_player = 'X'
  end

  def current_player
    @current_player
  end

  def play(column)
    if @current_player == 'X'
      @current_player = 'O'
    else
      @current_player = 'X'
    end
  end
  
end