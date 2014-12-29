# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CharacterWeapon do
  describe '#calculate_speed' do
    let(:character_weapon) { CharacterWeapon.new(speed: true) }

    context 'total speed is 0 or less' do
      let(:character_weapon) { CharacterWeapon.new(speed: true) }

      before do
        character_weapon.stub_chain(:weapon, :speed, :to_i).and_return(0)
        character_weapon.stub(:extract_bonus_from_stats_modifier_dsl_definition) { 0 }
        character_weapon.stub(:collection_of_stats_modifiers) { [] }
      end

      it { expect(character_weapon.calculate_speed).to eq 1 }
    end

    context 'total speed is more than 1' do
      let(:character_weapon) { CharacterWeapon.new(speed: false) }

      before do
        character_weapon.stub_chain(:weapon, :speed, :to_i).and_return(5)
        character_weapon.stub(:extract_bonus_from_stats_modifier_dsl_definition) { 1 }
        character_weapon.stub(:collection_of_stats_modifiers) { [] }
      end

      it { expect(character_weapon.calculate_speed).to eq 7 }
    end
  end

  describe '#calculate_damage' do
    let(:character_weapon) { CharacterWeapon.new(damage: false) }

    before do
      character_weapon.stub_chain(:character, :statistics, :calculate_s).and_return(13)
      character_weapon.stub_chain(:character, :statistics, :stats_modifiers, :select, :collect, :sum).and_return(1)
      character_weapon.stub_chain(:weapon, :cutting_dmg).and_return(1)
      character_weapon.stub_chain(:weapon, :pierce_dmg).and_return(2)
      character_weapon.stub_chain(:weapon, :crushing_dmg).and_return(3)
    end

    it { expect(character_weapon.calculate_damage).to eq '3s/4k/5o' }
  end

  describe '#hit_parameter' do
    let(:character_weapon) { CharacterWeapon.new }

    before do
     character_weapon.stub(:calculate_attack_bonus_for_particular_weapon) { 1 }
     character_weapon.stub(:attack_fencing_parameter) { 1 }
     character_weapon.stub(:weapon_proficiency_bonus) { 1 }
     character_weapon.stub_chain(:character, :statistics, :calculate_dexterity_and_strength_bonus) { 1 }
    end

    it { expect(character_weapon.hit_parameter).to eq 4 }
  end

  describe '#calculate_attack_bonus_for_particular_weapon' do
    #TODO
  end

  #TODO included methods
  describe '#collection_of_stats_modifiers' do

  end

  describe '#extract_bonus_from_stats_modifier_dsl_definition' do

  end

  describe '#sum_of_skill_preference_modifiers_for_weapon_or_weapon_group_specialisation' do

  end
end
