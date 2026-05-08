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

end