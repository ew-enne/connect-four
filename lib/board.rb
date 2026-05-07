class Board
  
  def initialize(rows, columns)
    @rows = rows
    @columns = columns
  end

  def add_piece(column)
    if column_has_space?    
      if column <= @columns && column > 0
        return true
      else
        return false
      end
    else
      return false
    end
  end

  private

  def column_has_space?
    false
  end

end