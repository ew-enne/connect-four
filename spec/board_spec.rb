require_relative '../lib/board.rb'

describe Board do
  
  describe '#add_piece' do

    context 'when a player adds a piece to the board' do

      subject(:board_piece) { described_class.new(6, 7) }
      
      it 'returns true when player adds a piece in column 4' do
        expect(board_piece.add_piece(4, 'X')).to be true
      end

      it 'returns false when a player adds a piece in column 8' do
        expect(board_piece.add_piece(8, 'X')).to be false
      end

      it 'returns false when a player adds a piece in column 0' do
        expect(board_piece.add_piece(0, 'X')).to be false
      end
    end

    context 'when a player adds a piece to an already full column' do
      
      subject(:board_piece) { described_class.new(6, 1) }

      it 'returns false when trying to add to a column that has 6 pieces' do
        6.times { board_piece.add_piece(1, 'X') }
        result = board_piece.add_piece(1, 'X')
        expect(result).to be false
      end
    end
  end

end