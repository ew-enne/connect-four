require_relative '../lib/game.rb'

describe Game do
  
  describe 'when game starts' do
    
    subject(:game_start) { described_class.new }

    it 'starts with player X' do
      expect(game_start.current_player).to eq('X')
    end
  end

  describe 'when turn switches' do
    
    subject(:game_switch) { described_class.new }

    it 'switches turns after first move' do
      game_switch.play(4)
      expect(game_switch.current_player).to eq('O')
    end

    it 'switches back to X after O plays' do
      game_switch.play(2)
      game_switch.play(5)
      expect(game_switch.current_player).to eq('X')
    end
  end

  describe 'when player chooses invalid column' do
    
    subject(:game_invalid_column) { described_class.new }

    it 'returns false when player chooses column 100' do
      invalid_choice = game_invalid_column.play(100)
      expect(invalid_choice).to eq(false)
    end
  end

  describe '#check_win' do

    context 'when there is a vertical win' do
    
      subject(:game_vertical_win) { described_class.new }

      it 'returns the winner when 4 pieces are stacked vertically' do
        game_vertical_win.play(4)
        game_vertical_win.play(2)
        game_vertical_win.play(4)
        game_vertical_win.play(2)
        game_vertical_win.play(4)
        game_vertical_win.play(2)
        game_vertical_win.play(4)
        game_vertical_win.play(1)
        winner = game_vertical_win.check_win
        expect(winner).to eq('X')
      end
    end

    context 'when there is no vertical win' do
      
      subject(:game_no_vertical_win) { described_class.new }

        it 'returns nil when there are no 4 pieces stacked vertically' do
          game_no_vertical_win.play(4)
          game_no_vertical_win.play(2)
          game_no_vertical_win.play(4)
          game_no_vertical_win.play(2)
          winner = game_no_vertical_win.check_win
          expect(winner).to be nil
        end
    end
  end

end