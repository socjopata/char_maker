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

  describe '#raw_shooting' do
    let(:statistics) { Statistics.new }
    let!(:stats_modifiers) { [create(:stats_modifier, modifies: 'fighting', group_name: 'Umiejętności Strzeleckie', value: 2)] }

    before do
      statistics.stats_modifiers << stats_modifiers
      statistics.stub_chain(:character, :profession, :shooting).and_return(2)
    end

    it { expect(statistics.raw_shooting).to eq 4 }
  end

  describe '#ranged_defense_bonus_from_skills' do
    let(:statistics) { Statistics.new }
    let!(:stats_modifiers) { [create(:stats_modifier, modifies: 'fighting', group_name: 'Obrona Daleka', value: 2)] }

    before do
      statistics.stats_modifiers << stats_modifiers
    end

    it { expect(statistics.ranged_defense_bonus_from_skills).to eq 2 }
  end

  describe '#total_ranged_defense' do
    let(:statistics) { Statistics.new }
    let(:shield) { double }

    before do
      statistics.stub(:the_above_fifteen_zr_bonus) { 5 }
      statistics.stub(:ranged_defense_bonus_from_skills) { 1 }
      statistics.stub(:special_ranged_defense_parameter) { 1 }
      shield.stub(:present?) { false }
    end

    it { expect(statistics.total_ranged_defense(shield)).to eq 27 }
  end

  describe 'special_ranged_defense_parameter' do
    let(:statistics) { Statistics.new }

    before do
      statistics.stub_chain(:character, :current_level).and_return(1)
      statistics.stub(:heavy_shield_bonus) { 1 }
    end

    it { expect(statistics.special_ranged_defense_parameter).to eq 2 }
  end

  describe '#heavy_shield_bonus' do
    let(:statistics) { Statistics.new }
    let(:shield) { create(:shield, special_rules: '+6pkt do Obrony Dystansowej.') }
    let!(:character_shield) { create(:character_shield, shield: shield) }

    it { expect(statistics.heavy_shield_bonus(character_shield)).to eq 6 }
  end
end
