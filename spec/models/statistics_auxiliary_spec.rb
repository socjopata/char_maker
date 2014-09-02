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
end