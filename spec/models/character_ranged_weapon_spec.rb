# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CharacterRangedWeapon do
  describe '#shooting_ranges' do
    context 'no range modifications' do
      let(:character_ranged_weapon) { CharacterRangedWeapon.new }

      before do
        character_ranged_weapon.stub_chain(:resource, :range).and_return('25/50/100')
        character_ranged_weapon.stub_chain(:character, :skills, :map, :include?).and_return(false)
      end

      it { expect(character_ranged_weapon.shooting_ranges).to eq '25/50/100' }
    end

    context 'the ranged weapon is finely crafted' do
      let(:character_ranged_weapon) { CharacterRangedWeapon.new(range: true) }

      before do
        character_ranged_weapon.stub_chain(:resource, :range).and_return('25/50/100')
        character_ranged_weapon.stub_chain(:character, :skills, :map, :include?).and_return(true)
      end

      it { expect(character_ranged_weapon.shooting_ranges).to eq '50/75/125' }
    end
  end

  describe '#calculate_speed' do
    context 'total speed is 0 or less' do
      let(:character_ranged_weapon) { CharacterRangedWeapon.new(speed: true) }

      before do
        character_ranged_weapon.stub_chain(:resource, :speed, :to_i).and_return(0)
        character_ranged_weapon.stub(:extract_bonus_from_stats_modifier_dsl_definition) { 0 }
        character_ranged_weapon.stub_chain(:character, :statistics, :stats_modifiers, :select, :collect, :sum).and_return(0)
        character_ranged_weapon.stub(:collection_of_stats_modifiers) { [] }
      end

      it { expect(character_ranged_weapon.calculate_speed).to eq 1 }
    end

    context 'total speed is more than 1' do
      let(:character_ranged_weapon) { CharacterRangedWeapon.new(speed: false) }

      before do
        character_ranged_weapon.stub_chain(:resource, :speed, :to_i).and_return(5)
        character_ranged_weapon.stub(:extract_bonus_from_stats_modifier_dsl_definition) { 1 }
        character_ranged_weapon.stub_chain(:character, :statistics, :stats_modifiers, :select, :collect, :sum).and_return(0)
        character_ranged_weapon.stub(:collection_of_stats_modifiers) { [] }
      end

      it { expect(character_ranged_weapon.calculate_speed).to eq 7 }
    end
  end

  describe '#calculate_damage' do
    let(:character_ranged_weapon) { CharacterRangedWeapon.new(damage: false) }

    context 'ranged weapon is a bow' do
      before do
        character_ranged_weapon.stub_chain(:character, :statistics, :calculate_s).and_return(13)
        character_ranged_weapon.stub_chain(:character, :statistics, :stats_modifiers, :select, :collect, :sum).and_return(1)
        character_ranged_weapon.stub_chain(:resource, :is_a_bow?).and_return(true)
        character_ranged_weapon.stub_chain(:resource, :dmg_type).and_return('k')
        character_ranged_weapon.stub_chain(:resource, :dmg).and_return(5)
      end

      it { expect(character_ranged_weapon.calculate_damage).to eq '7k' }
    end

    context 'ranged weapon is a crossbow' do
      before do
        character_ranged_weapon.stub_chain(:character, :statistics, :calculate_s).and_return(13)
        character_ranged_weapon.stub_chain(:character, :statistics, :stats_modifiers, :select, :collect, :sum).and_return(1)
        character_ranged_weapon.stub_chain(:resource, :is_a_bow?).and_return(false)
        character_ranged_weapon.stub_chain(:resource, :dmg_type).and_return('k')
        character_ranged_weapon.stub_chain(:resource, :dmg).and_return(5)
      end

      it { expect(character_ranged_weapon.calculate_damage).to eq '8k' }
    end
  end

  describe '#weapon_accuracy' do

  end

  describe '#character_shooting_skill' do

  end


  describe '#total_hit_chance_parameter' do

  end
end