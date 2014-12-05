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

  describe '#calculate_casting' do
    let(:statistics) { Statistics.new }

    before do
      statistics.stub(:main_parameter_bonus) { 1 }
      statistics.stub(:character_level_bonus) { 1 }
      statistics.stub(:bonus_from_skills) { 1 }
      statistics.stub(:special_casting_bonus) { 1 }
    end

    it { expect(statistics.calculate_casting).to eq 4 }
  end

  describe '#main_parameter_bonus' do
    let(:statistics) { Statistics.new }

    context 'character is a cleric' do
      before do
        statistics.stub_chain(:character, :is_a_cleric?).and_return(true)
        statistics.stub(:calculate_wi) { 10 }
      end

      it { expect(statistics.main_parameter_bonus).to eq '+0' }
    end

    context 'character is a wizard' do
      before do
        statistics.stub_chain(:character, :is_a_cleric?).and_return(false)
        statistics.stub(:calculate_int) { 13 }
      end

      it { expect(statistics.main_parameter_bonus).to eq '+1' }
    end
  end

  describe '#character_level_bonus' do
    let(:statistics) { Statistics.new }

    context 'level 1' do
      before do
        statistics.stub_chain(:character, :current_level).and_return(1)
      end

      it { expect(statistics.character_level_bonus).to eq 0 }
    end

    context 'level 2' do
      before do
        statistics.stub_chain(:character, :current_level).and_return(2)
      end

      it { expect(statistics.character_level_bonus).to eq 1 }
    end
  end

  describe '#special_casting_bonus' do
    let(:statistics) { Statistics.new }

    it { expect(statistics.special_casting_bonus).to eq 0 }
  end

  describe '#bonus_from_skills' do
    let(:statistics) { Statistics.new }
    let!(:stats_modifiers) { [create(:stats_modifier, modifies: 'casting', group_name: name, value: 5)] }
    let(:name) { 'Spell casting' }

    before do
      statistics.stats_modifiers << stats_modifiers
    end

    it { expect(statistics.bonus_from_skills(name)).to eq 5 }
  end

  describe '#calculate_break' do
    let(:statistics) { Statistics.new }

    before do
      statistics.stub_chain(:character, :is_a_cleric?).and_return(false)
      statistics.stub(:calculate_int) { 13 }
      statistics.stub_chain(:character, :current_level).and_return(3)
      statistics.stub(:special_break_bonus) { 1 }
    end

    it { expect(statistics.calculate_break).to eq 3 }
  end

  describe '#special_break_bonus' do
    let(:statistics) { Statistics.new }

    before do
      statistics.stub(:trait_modifier_for_auxiliary_parameter_named) { 1 }
    end

    it { expect(statistics.special_break_bonus).to eq 1 }
  end

  describe '#calculate_amount_of_extra_spells' do
    let(:statistics) { Statistics.new }
    let!(:stats_modifiers) { [create(:stats_modifier, modifies: 'casting', group_name: name, value: 5)] }
    let(:name) { 'Dodatkowe zaklęcia' }

    before do
      statistics.stats_modifiers << stats_modifiers
    end

    it { expect(statistics.calculate_amount_of_extra_spells).to eq 5 }
  end
end
