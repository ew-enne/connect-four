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

  def check_win
    check_vertical || check_horizontal || check_diagonal
  end

  # helper methods for #check_win
  def check_vertical
    @board.cells.any? do |column|
      column.each_cons(4).any? do |four_cells|
        if four_cells.uniq.size == 1 && ['X', 'O'].include?(four_cells.first)
          return four_cells.first
        end
      end
    end
    nil    
  end

  # helper method for #check_win
  def check_horizontal
    @board.cells.transpose.any? do |column|
      column.each_cons(4).any? do |four_cells|
        if four_cells.uniq.size == 1 && ['X', 'O'].include?(four_cells.first)
          return four_cells.first
        end
      end
    end
    nil
  end

  # helper method for #check_win
  def check_diagonal
    
  end
  
end