# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Statistics do
  let(:statistics) { Statistics.new }

  describe '#calculate_initiative' do
    before do
      statistics.stub_chain(:character, :profession, :general_type).and_return('rogue')
      statistics.stub_chain(:character, :character_background, :traits, :present?).and_return(false)
      statistics.stub(:calculate_zr) { 20 }
    end

    it { expect(statistics.calculate_initiative).to eq 18 }
  end

  describe '#calculate_perception' do
    before do
      statistics.stub_chain(:character, :profession, :general_type).and_return('rogue')
      statistics.stub_chain(:character, :current_level).and_return(1)
      statistics.stub_chain(:character, :character_background, :traits, :present?).and_return(false)
    end

    it { expect(statistics.calculate_perception).to eq 19 }
  end

  describe '#calculate_pain_resistance' do
    before do
      statistics.stub_chain(:character, :profession, :general_type).and_return('rogue')
      statistics.stub(:calculate_wt) { 20 }
      statistics.stub_chain(:character, :character_background, :traits, :present?).and_return(false)
    end

    it { expect(statistics.calculate_pain_resistance).to eq 13 }
  end

  describe '#calculate_fear_resistance' do
    before do
      statistics.stub_chain(:character, :profession, :general_type).and_return('rogue')
      statistics.stub(:calculate_wi) { 20 }
      statistics.stub_chain(:character, :character_background, :traits, :present?).and_return(false)
    end

    it { expect(statistics.calculate_fear_resistance).to eq 11 }
  end

  describe '#calculate_magic_resistance' do
    before do
      statistics.stub_chain(:character, :profession, :general_type).and_return('rogue')
      statistics.stub(:magic_resistance_shield_bonus_for) { 0 }
      statistics.stub_chain(:character, :character_background, :traits, :present?).and_return(false)
    end

    it { expect(statistics.calculate_magic_resistance).to eq 0 }
  end

  describe '#calculate_life_points' do
    before do
      statistics.stub_chain(:character, :profession, :general_type).and_return('rogue')
      statistics.stub(:calculate_wt) { 20 }
      statistics.stub_chain(:character, :character_background, :traits, :present?).and_return(false)
    end

    it { expect(statistics.calculate_life_points).to eq 34 }
  end

  describe '#calculate_running' do
    before do
      statistics.stub_chain(:character, :profession, :general_type).and_return('rogue')
      statistics.stub(:calculate_current_zr) { 20 }
      statistics.stub_chain(:character, :character_background, :traits, :present?).and_return(false)
    end

    it { expect(statistics.calculate_running).to eq 13 }
  end

  describe '#calculate_sprinting' do
    before do
      statistics.stub_chain(:character, :profession, :general_type).and_return('rogue')
      statistics.stub(:calculate_current_zr) { 20 }
      statistics.stub_chain(:character, :character_background, :traits, :present?).and_return(false)
    end

    it { expect(statistics.calculate_sprinting).to eq 23 }
  end

  describe '#calculate_auxiliary_bonus' do
    let(:statistics) { Statistics.new }
    let(:group_name) { 'test skill' }
    let!(:stats_modifiers) { [create(:stats_modifier, modifies: 'auxiliary', group_name: group_name, value: 2)] }

    before do
      statistics.stats_modifiers << stats_modifiers
      statistics.stub_chain(:character, :character_background, :traits, :present?).and_return(false)
      statistics.stub(:calculate_variable_auxiliary_bonus).and_return(0)
    end

    it { expect(statistics.calculate_auxiliary_bonus(group_name)).to eq 2 }
    #TODO additional contexts?
  end

  describe '#calculate_variable_auxiliary_bonus' do
    let(:statistics) { Statistics.new(endurance: 20) }
    let(:group_name) { 'Punkty Życia' }
    let!(:stats_modifiers) { [create(:stats_modifier, modifies: 'variable_auxiliary', group_name: group_name, value: 2,
                                     evaluated_instruction: 'Statistics::BONUS_OR_PENALTY_RANGES[calculate_wt]')] }
    before do
      statistics.stats_modifiers << stats_modifiers
      statistics.stub(:calculate_wt).and_return(23)
    end

    it { expect(statistics.calculate_variable_auxiliary_bonus(group_name)).to eq 4 }
  end

  describe '#magic_resistance_shield_bonus_for' do
    let(:statistics) { Statistics.new }
    let(:character_shield) { double }
    let(:character) { double }
    let(:stats_choice) { stats_modifier.stats_choice }
    let!(:stats_modifier) { create(:stats_modifier, modifies: 'auxiliary', group_name: 'Odporność na Magię', value: 2) }

    before do
      character.stub_chain(:character_shields, :where, :first).and_return(character_shield)
      character_shield.stub_chain(:resource, :stats_choices, :first).and_return(stats_choice)
    end

    it { expect(statistics.magic_resistance_shield_bonus_for(character)).to eq 2 }
  end
end
