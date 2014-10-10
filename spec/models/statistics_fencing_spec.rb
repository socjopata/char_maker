# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Statistics do
  describe '#raw_fencing_when_defending' do
    #see #raw_fencing
  end

  describe '#raw_fencing_when_attacking' do
    #see #raw_fencing
  end

  describe '#raw_fencing' do
    let(:statistics) { Statistics.new }
    let!(:stats_modifiers) { [create(:stats_modifier, modifies: 'fighting', group_name: 'Fechtunek postaci zwiększony będzie o', value: 2),
                              create(:stats_modifier, modifies: 'fighting', group_name: 'Fechtunek w Ataku', value: 2)] }


    before do
      statistics.stats_modifiers << stats_modifiers
      statistics.stub_chain(:character, :profession, :[]).and_return(2)
    end

    context 'stance equals attack' do
      let(:stance) { 'attack' }
      it { expect(statistics.raw_fencing(stance)).to eq 6 }
    end

    context 'stance equals defense' do
      let(:stance) { 'defense' }
      it { expect(statistics.raw_fencing(stance)).to eq 4 }
    end
  end
end
