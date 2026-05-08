class Board
  
  def initialize(rows, columns)
    @rows = rows
    @columns = columns 
    @board = Array.new(columns) { Array.new(rows, '') }
  end

  def add_piece(column, marker)
    return false unless valid_column_range?(column)
    return false unless column_has_space?(column)

    # find the first empty cell in the column and add a marker
    row_index = @board[column].find_index { |cell| cell == '' }
    @board[column][row_index] = marker

    true
  end

  # helper method for testing purposes
  def [](row, column)
    @board[column][row]
  end
  
  private

  # checks if the chosen column fall within the scope of the existing board
  def valid_column_range?(column)
    column < @columns && column > 0
  end

  # checks if a column is already full
  def column_has_space?(column)
    @board[column].any? { |cell| cell == '' }
  end

end