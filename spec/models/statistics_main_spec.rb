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

  describe '#calculate_main_skill_bonus_for' do
    let(:statistics) { Statistics.new(dexterity: 20) }
    let(:name) { 'some name' }
    let!(:stats_modifiers) { [create(:stats_modifier, modifies: name, group_name: 'test skill')] }

    before do
      statistics.stats_modifiers << stats_modifiers
    end

    it { expect(statistics.calculate_main_skill_bonus_for(name)).to eq 2 }
  end

  #TODO consider refactoring two following specs
  describe '#trait_modifier_for_main_skill_named' do
    let(:statistics) { Statistics.new(dexterity: 20) }
    let(:name) { 'some name' }
    let!(:stats_modifiers) { [create(:stats_modifier, modifies: name, group_name: 'test skill')] }

    before do
      statistics.stub_chain(:character, :character_background, :traits, :present?).and_return(true)
      statistics.stub_chain(:character, :character_background, :traits, :first, :stats_choices, :present?).and_return(true)
      statistics.stub_chain(:character, :character_background, :traits, :first, :stats_choices, :first, :stats_modifiers).and_return(stats_modifiers)
    end

    it { expect(statistics.trait_modifier_for_main_skill_named(name)).to eq 2 }
  end

  describe '#trait_modifier_for_auxiliary_parameter_named' do
    let(:statistics) { Statistics.new(dexterity: 20) }
    let(:name) { 'some name' }
    let!(:stats_modifiers) { [create(:stats_modifier, modifies: 'test', group_name: name)] }

    before do
      statistics.stub_chain(:character, :character_background, :traits, :present?).and_return(true)
      statistics.stub_chain(:character, :character_background, :traits, :first, :stats_choices, :present?).and_return(true)
      statistics.stub_chain(:character, :character_background, :traits, :first, :stats_choices, :first, :stats_modifiers).and_return(stats_modifiers)
    end

    it { expect(statistics.trait_modifier_for_auxiliary_parameter_named(name)).to eq 2 }
  end

  describe '#calculate_dexterity_bonus' do
    let(:statistics) { Statistics.new }

    before { statistics.stub(:calculate_zr) { 13 } }

    it { expect(statistics.calculate_dexterity_bonus).to eq 1 }
  end

  describe '#calculate_strength_bonus' do
    let(:statistics) { Statistics.new }

    before { statistics.stub(:calculate_s) { 13 } }

    it { expect(statistics.calculate_strength_bonus).to eq 1 }
  end

  describe '#calculate_dexterity_and_strength_bonus' do
    let(:statistics) { Statistics.new }

    before { statistics.stub(:calculate_zr) { 13 } }
    before { statistics.stub(:calculate_s) { 16 } }

    it { expect(statistics.calculate_dexterity_and_strength_bonus).to eq 2 }
  end

  describe '#the_above_fifteen_zr_bonus' do
    let(:statistics) { Statistics.new }

    context 'character dexterity is pretty low' do
      before { statistics.stub(:calculate_current_zr) { 10 } }

      it { expect(statistics.the_above_fifteen_zr_bonus).to eq 0 }
    end

    context 'character dexterity is high enough for bonus to be present' do
      before { statistics.stub(:calculate_current_zr) { 19 } }

      it { expect(statistics.the_above_fifteen_zr_bonus).to eq 4 }
    end
  end

  describe '#special_bonus_from_weapons' do
    let(:statistics) { Statistics.new }
    let(:character) { double }

    context 'character has noble mace equiped' do
      before { character.stub_chain(:weapons, :where, :first).and_return(true) }

      it { expect(statistics.special_bonus_from_weapons(character)).to eq 1 }
    end

    context 'character has some other weapon equiped' do
      before { character.stub_chain(:weapons, :where, :first).and_return(false) }

      it { expect(statistics.special_bonus_from_weapons(character)).to eq 0 }
    end
  end
end
