require_relative '../lib/board.rb'

describe Board do
  
  describe '#add_piece' do

    context 'when a player adds a piece to the board' do

      subject(:board_piece) { described_class.new(6, 7) }
      
      it 'returns true when player adds a piece in column 3' do
        expect(board_piece.add_piece(3, 'X')).to be true
      end

      it 'returns false when a player adds a piece in column 7' do
        expect(board_piece.add_piece(7, 'X')).to be false
      end

      it 'returns false when a player adds a piece in column -1' do
        expect(board_piece.add_piece(-1, 'X')).to be false
      end
    end

    context 'when a player adds a piece to an already full column' do
      
      subject(:board_piece) { described_class.new(6, 1) }

      it 'returns false when trying to add to a column that has 6 pieces' do
        6.times { board_piece.add_piece(0, 'X') }
        result = board_piece.add_piece(0, 'X')
        expect(result).to be false
      end
    end

    context 'when a piece is added to column 4' do

      subject(:board_piece_column_four) { described_class.new(6, 7) }

      it 'checks if the piece has landed in row 0 of column 4' do
        board_piece_column_four.add_piece(3, 'X')
        cell_content = board_piece_column_four[0, 3]
        expect(cell_content).to eq('X')
      end
    end

    context 'when two pieces are added in two different columns' do
      subject(:board_two_pieces) { described_class.new(6, 7) }

      it 'checks if piece 1 with marker O lands in column 2 in row 2 and  piece 2 with marker X lands in column 5 and row 0' do
        2.times { board_two_pieces.add_piece(2, 'X') }
        board_two_pieces.add_piece(2, 'O')
        board_two_pieces.add_piece(5, 'X')
        cell_content_piece_1 = board_two_pieces[2, 2]
        cell_content_piece_2 = board_two_pieces[0, 5]
        expect(cell_content_piece_1).to eq('O')
        expect(cell_content_piece_2).to eq('X')
      end
    end
  end

end