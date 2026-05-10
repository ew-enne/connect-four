require_relative 'board.rb'

class Game

  def initialize
    @current_player = 'X'
    @board = Board.new(6, 7)
  end

  def current_player
    @current_player
  end

  def play(column)
    next_player = (@current_player == 'X') ? "O" : "X" 
    return false unless @board.add_piece(column, @current_player)
    @current_player = next_player
    true
  end
  
end