# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Statistics do
  describe '#calculate_mana_points' do
    let(:statistics) { Statistics.new }

    context 'character is a cleric' do
      before do
        statistics.stub_chain(:character, :is_a_cleric?).and_return(true)
        statistics.stub(:calculate_wi) { 20 }
        statistics.stub(:mana_bonuses_from_skills) { 20 }
        statistics.stub_chain(:calculate_int, :to_f) { 20 }
        statistics.stub_chain(:character, :current_level).and_return(1)
      end

      it { expect(statistics.calculate_mana_points).to be_within(5).of(56) }
    end


    context 'character is a non caster' do
      before do
        statistics.stub_chain(:character, :is_a_cleric?).and_return(false)
        statistics.stub_chain(:character, :is_a_non_caster?).and_return(true)
      end

      it { expect(statistics.calculate_mana_points).to eq 0 }
    end

    context 'character is a caster' do
      before do
        statistics.stub_chain(:character, :is_a_cleric?).and_return(false)
        statistics.stub_chain(:character, :is_a_non_caster?).and_return(false)
        statistics.stub(:calculate_int) { 20 }
        statistics.stub_chain(:calculate_wi, :to_f) { 20 }
        statistics.stub(:mana_bonuses_from_skills) { 20 }
        statistics.stub_chain(:character, :current_level).and_return(1)
      end

      it { expect(statistics.calculate_mana_points).to be_within(5).of(56) }
    end
  end

  describe 'mana_bonuses_from_skills' do
    let(:statistics) { Statistics.new }
    let!(:stats_modifiers) { [create(:stats_modifier, modifies: 'power level', value: 5),
                              create(:stats_modifier, modifies: 'power level', value: 0, group_name: '1k10')] }

    before do
      statistics.stats_modifiers << stats_modifiers
    end

    it { expect(statistics.mana_bonuses_from_skills).to be_within(5).of(10) }
  end
end
