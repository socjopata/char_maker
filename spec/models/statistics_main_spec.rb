# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Statistics do
  describe '#calculate_s' do
    let(:statistics) { Statistics.new(strength: 20) }
    let!(:stats_modifiers) { [create(:stats_modifier, modifies: 'S', group_name: 'test skill')] }

    before do
      statistics.stats_modifiers << stats_modifiers
      statistics.stub_chain(:character, :character_background, :traits, :present?).and_return(false)
    end

    it { expect(statistics.calculate_s).to eq 22 }
  end
end