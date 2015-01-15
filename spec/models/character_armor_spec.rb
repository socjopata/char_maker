# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CharacterArmor do
  describe '#protection_levels' do

  end

  describe '#calculate_dexterity_nerf' do
    context 'armor is upgraded' do
      let(:character_armor) { CharacterArmor.new(dexterity_nerf: true) }

      before do
        character_armor.stub_chain(:character, :statistics, :stats_modifiers, :select, :collect, :sum).and_return(2)
        character_armor.stub_chain(:armor, :dexterity_nerf).and_return(5)
      end

      it { expect(character_armor.calculate_dexterity_nerf).to eq -1 }
    end

    context 'armor is regular' do
      let(:character_armor) { CharacterArmor.new(dexterity_nerf: false) }

      before do
        character_armor.stub_chain(:character, :statistics, :stats_modifiers, :select, :collect, :sum).and_return(2)
        character_armor.stub_chain(:armor, :dexterity_nerf).and_return(5)
      end

      it { expect(character_armor.calculate_dexterity_nerf).to eq -3 }
    end

    context 'bonuses are larger than 0' do
      let(:character_armor) { CharacterArmor.new(dexterity_nerf: true) }

      before do
        character_armor.stub_chain(:character, :statistics, :stats_modifiers, :select, :collect, :sum).and_return(2)
        character_armor.stub_chain(:armor, :dexterity_nerf).and_return(1)
      end

      it { expect(character_armor.calculate_dexterity_nerf).to eq '-' }
    end
  end

  describe '#calculate_dexterity_cap' do

  end

  describe '#required_strength' do

  end
end
