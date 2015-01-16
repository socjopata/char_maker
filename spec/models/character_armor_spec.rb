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
    context 'armor is upgraded' do
      let(:character_armor) { CharacterArmor.new(dexterity_cap: true) }

      before do
        character_armor.stub_chain(:character, :statistics, :stats_modifiers, :select, :collect, :sum).and_return(2)
        character_armor.stub_chain(:armor, :dexterity_cap).and_return(20)
      end

      it { expect(character_armor.calculate_dexterity_cap).to eq 25 }
    end

    context 'armor is regular' do
      let(:character_armor) { CharacterArmor.new(dexterity_cap: false) }

      before do
        character_armor.stub_chain(:character, :statistics, :stats_modifiers, :select, :collect, :sum).and_return(2)
        character_armor.stub_chain(:armor, :dexterity_cap).and_return(20)
      end

      it { expect(character_armor.calculate_dexterity_cap).to eq 22 }
    end
  end

  describe '#required_strength' do
    let(:character_armor) { CharacterArmor.new }

    context 'requirement is present' do
      before do
        character_armor.stub_chain(:armor, :armament_requirements, :detect, :value).and_return(5)
      end

      it { expect(character_armor.required_strength).to eq 5 }
    end

    context 'no requirement' do
      before do
        character_armor.stub_chain(:armor, :armament_requirements, :detect, :value).and_return(nil)
      end

      it { expect(character_armor.required_strength).to eq '-' }
    end
  end
end
