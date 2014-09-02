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

  describe '#calculate_o' do
    let(:statistics) { Statistics.new(polish: 20) }
    let!(:stats_modifiers) { [create(:stats_modifier, modifies: 'O', group_name: 'test skill')] }

    before do
      statistics.stats_modifiers << stats_modifiers
      statistics.stub_chain(:character, :character_background, :traits, :present?).and_return(false)
      statistics.stub_chain(:character, :weapons, :where, :first).and_return(true)
    end

    it { expect(statistics.calculate_o).to eq 23 }
  end

  describe '#calculate_main_stats' do
    let(:statistics) { Statistics.new(strength: 20, polish: 20, dexterity: 20, faith: 20, intelligence: 20, endurance: 20) }

    before do
      statistics.stub_chain(:character, :character_background, :traits, :present?).and_return(false)
      statistics.stub_chain(:character, :weapons, :where, :first).and_return(false)
    end

    it { expect(statistics.calculate_main_stats).to eq [20, 20, 20, 20, 20, 20] }
  end

  #TODO refactor using behaves like / shared contexts
  describe '#calculate_current_zr' do
    let(:statistics) { Statistics.new(dexterity: 20) }

    context 'character is naked' do
      before do
        statistics.stub_chain(:character, :character_armors, :detect).and_return(nil)
        statistics.stub_chain(:character, :wield_style, :name).and_return('some text')
        statistics.stub(:calculate_zr) { 20 }
      end

      it { expect(statistics.calculate_current_zr).to eq 20 }
    end

    context 'character has only armor' do
      let(:armor) { double }

      before do
        armor.stub(:calculate_dexterity_cap) { 15 }
        armor.stub(:calculate_dexterity_nerf) { -3 }
        statistics.stub_chain(:character, :character_armors, :detect).and_return(armor)
        statistics.stub_chain(:character, :wield_style, :name).and_return('some text')
        statistics.stub(:calculate_zr) { 20 }
      end

      it { expect(statistics.calculate_current_zr).to eq 15 }
    end

    context 'character fights with one handed weapon and shield' do
      context 'character has only shield' do
        let(:armor) { double }
        let(:shield) { double }

        before do
          shield.stub(:calculate_dexterity_cap) { 20 }
          shield.stub(:calculate_dexterity_nerf) { -3 }
          statistics.stub_chain(:character, :character_armors, :detect).and_return(nil)
          statistics.stub_chain(:character, :character_shields, :detect).and_return(shield)
          statistics.stub_chain(:character, :wield_style, :name).and_return('Styl walki bronią i tarczą')
          statistics.stub(:calculate_zr) { 17 }
        end

        it { expect(statistics.calculate_current_zr).to eq 14 }
      end

      context 'character has only armor' do
        let(:armor) { double }

        before do
          armor.stub(:calculate_dexterity_cap) { 15 }
          armor.stub(:calculate_dexterity_nerf) { -3 }
          statistics.stub_chain(:character, :character_armors, :detect).and_return(armor)
          statistics.stub_chain(:character, :character_shields, :detect).and_return(nil)
          statistics.stub_chain(:character, :wield_style, :name).and_return('Styl walki bronią i tarczą')
          statistics.stub(:calculate_zr) { 20 }
        end

        it { expect(statistics.calculate_current_zr).to eq 15 }
      end

      context 'character has both armor and shield' do
        let(:armor) { double }
        let(:shield) { double }

        before do
          armor.stub(:calculate_dexterity_cap) { 15 }
          armor.stub(:calculate_dexterity_nerf) { -3 }
          shield.stub(:calculate_dexterity_cap) { 20 }
          shield.stub(:calculate_dexterity_nerf) { -3 }
          statistics.stub_chain(:character, :character_armors, :detect).and_return(armor)
          statistics.stub_chain(:character, :character_shields, :detect).and_return(shield)
          statistics.stub_chain(:character, :wield_style, :name).and_return('Styl walki bronią i tarczą')
          statistics.stub(:calculate_zr) { 20 }
        end

        it { expect(statistics.calculate_current_zr).to eq 14 }
      end
    end

    context 'result is negative' do
      let(:armor) { double }

      before do
        armor.stub(:calculate_dexterity_cap) { 15 }
        armor.stub(:calculate_dexterity_nerf) { -21 }
        statistics.stub_chain(:character, :character_armors, :detect).and_return(armor)
        statistics.stub_chain(:character, :character_shields, :detect).and_return(nil)
        statistics.stub_chain(:character, :wield_style, :name).and_return('some text')
        statistics.stub(:calculate_zr) { 20 }
      end

      it { expect(statistics.calculate_current_zr).to eq 1 }
    end

    context 'character is not capped by wearing an armor' do
      let(:armor) { double }

      before do
        armor.stub(:calculate_dexterity_cap) { 20 }
        armor.stub(:calculate_dexterity_nerf) { 0 }
        statistics.stub_chain(:character, :character_armors, :detect).and_return(armor)
        statistics.stub_chain(:character, :character_shields, :detect).and_return(nil)
        statistics.stub_chain(:character, :wield_style, :name).and_return('some text')
        statistics.stub(:calculate_zr) { 20 }
      end

      it { expect(statistics.calculate_current_zr).to eq 20 }
    end

    context 'character is actually capped by wearing an armor' do
      let(:armor) { double }

      before do
        armor.stub(:calculate_dexterity_cap) { 19 }
        armor.stub(:calculate_dexterity_nerf) { 0 }
        statistics.stub_chain(:character, :character_armors, :detect).and_return(armor)
        statistics.stub_chain(:character, :character_shields, :detect).and_return(nil)
        statistics.stub_chain(:character, :wield_style, :name).and_return('some text')
        statistics.stub(:calculate_zr) { 20 }
      end

      it { expect(statistics.calculate_current_zr).to eq 19 }
    end
  end
end