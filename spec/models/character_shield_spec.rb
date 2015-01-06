# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CharacterShield do
  describe '#calculate_dexterity_nerf' do
    context 'shield is upgraded' do
      let(:character_shield) { CharacterShield.new(dexterity_nerf: true) }

      before do
        character_shield.stub_chain(:character, :statistics, :stats_modifiers, :select, :collect, :sum).and_return(2)
        character_shield.stub_chain(:shield, :dexterity_nerf).and_return(5)
      end

      it { expect(character_shield.calculate_dexterity_nerf).to eq -1 }
    end

    context 'shield is regular' do
      let(:character_shield) { CharacterShield.new(dexterity_nerf: false) }

      before do
        character_shield.stub_chain(:character, :statistics, :stats_modifiers, :select, :collect, :sum).and_return(2)
        character_shield.stub_chain(:shield, :dexterity_nerf).and_return(5)
      end

      it { expect(character_shield.calculate_dexterity_nerf).to eq -3 }
    end

    context 'bonuses are larger than 0' do
      let(:character_shield) { CharacterShield.new(dexterity_nerf: true) }

      before do
        character_shield.stub_chain(:character, :statistics, :stats_modifiers, :select, :collect, :sum).and_return(2)
        character_shield.stub_chain(:shield, :dexterity_nerf).and_return(1)
      end

      it { expect(character_shield.calculate_dexterity_nerf).to eq '-' }
    end
  end

  describe '#calculate_dexterity_cap' do
    context 'shield is upgraded' do
      let(:character_shield) { CharacterShield.new(dexterity_cap: true) }

      before do
        character_shield.stub_chain(:character, :statistics, :stats_modifiers, :select, :collect, :sum).and_return(2)
        character_shield.stub_chain(:shield, :dexterity_cap).and_return(20)
      end

      it { expect(character_shield.calculate_dexterity_cap).to eq 24 }
    end

    context 'shield is regular' do
      let(:character_shield) { CharacterShield.new(dexterity_cap: false) }

      before do
        character_shield.stub_chain(:character, :statistics, :stats_modifiers, :select, :collect, :sum).and_return(2)
        character_shield.stub_chain(:shield, :dexterity_cap).and_return(20)
      end

      it { expect(character_shield.calculate_dexterity_cap).to eq 22 }
    end
  end

  describe '#required_strength' do
    let(:character_shield) { CharacterShield.new }

    context 'requirement is present' do
      before do
        character_shield.stub_chain(:shield, :armament_requirements, :detect, :value).and_return(5)
      end

      it { expect(character_shield.required_strength).to eq 5 }
    end

    context 'no requirement' do
      before do
        character_shield.stub_chain(:shield, :armament_requirements, :detect, :value).and_return(nil)
      end

      it { expect(character_shield.required_strength).to eq '-' }
    end
  end

  describe '#total_defense_bonus' do
    let(:character_shield) { CharacterShield.new(defense_bonus: true) }

    context 'sword and shield fightstyle' do
      context 'melee' do
        before do
          character_shield.stub_chain(:character, :wield_style, :name).and_return('Styl walki bronią i tarczą')
          character_shield.stub_chain(:resource, :ranged_defense_bonus, :to_i).and_return(1)
          character_shield.stub_chain(:shield, :defense_bonus).and_return(1)
        end

        it { expect(character_shield.total_defense_bonus(true)).to eq 2 }
      end

      context 'not melee' do
        before do
          character_shield.stub_chain(:character, :wield_style, :name).and_return('Styl walki bronią i tarczą')
          character_shield.stub_chain(:resource, :ranged_defense_bonus, :to_i).and_return(1)
          character_shield.stub_chain(:shield, :defense_bonus).and_return(1)
        end

        it { expect(character_shield.total_defense_bonus(false)).to eq 3 }
      end
    end

    context 'different fightstyle' do
      before do
        character_shield.stub_chain(:character, :wield_style, :name).and_return('something')
      end

      it { expect(character_shield.total_defense_bonus).to eq 0 }
    end
  end
end