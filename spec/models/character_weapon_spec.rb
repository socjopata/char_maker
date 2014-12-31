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
    let(:character_weapon) { CharacterWeapon.new(attack_bonus: 1) }

    before do
      character_weapon.stub_chain(:weapon, :attack_bonus, :to_i).and_return(1)
    end

    it { expect(character_weapon.calculate_attack_bonus_for_particular_weapon).to eq 2 }
  end

  describe '#calculate_defense_bonus_for_particular_weapon' do
    let(:character_weapon) { CharacterWeapon.new(defense_bonus: 1) }

    before do
      character_weapon.stub_chain(:weapon, :defense_bonus, :to_i).and_return(1)
    end

    it { expect(character_weapon.calculate_defense_bonus_for_particular_weapon).to eq 2 }
  end

  describe '#special_defense_bonus_for_total_defense_listing' do
    let(:character_weapon) { CharacterWeapon.new }
    let(:stats_modifiers) { [create(:stats_modifier, modifies: 'fighting', group_name: 'Obrona Bliska', value: 2)] }

    before do
      character_weapon.stub_chain(:character, :statistics, :stats_modifiers).and_return(stats_modifiers)
      character_weapon.stub(:broad_sword_and_shield_modifier) { 0 }
    end

    it { expect(character_weapon.special_defense_bonus_for_total_defense_listing).to eq 2 }
  end

  describe '#broad_sword_and_shield_modifier' do
    let(:character_weapon) { CharacterWeapon.new }

    before do
      character_weapon.stub_chain(:character, :character_shields, :present?).and_return(true)
      character_weapon.stub_chain(:resource, :name).and_return('Miecz Szeroki')
    end

    it { expect(character_weapon.broad_sword_and_shield_modifier).to eq 1 }
  end

  describe '#attack_fencing_parameter' do
    let(:character_weapon) { CharacterWeapon.new }

    before do
       character_weapon.stub(:extract_bonus_from_stats_modifier_dsl_definition) { 1 }
       character_weapon.stub(:collection_of_stats_modifiers) { [] }
       character_weapon.stub_chain(:character, :statistics, :raw_fencing_when_attacking) { 1 }
       character_weapon.stub(:fencing_master_modifier) { 1 }
    end

    it { expect(character_weapon.attack_fencing_parameter).to eq 4 }
  end

  describe '#defense_fencing_parameter' do
    let(:character_weapon) { CharacterWeapon.new }

    before do
      character_weapon.stub(:extract_bonus_from_stats_modifier_dsl_definition) { 1 }
      character_weapon.stub(:collection_of_stats_modifiers) { [] }
      character_weapon.stub_chain(:character, :statistics, :raw_fencing_when_defending) { 1 }
      character_weapon.stub(:fencing_master_modifier) { 1 }
    end

    it { expect(character_weapon.defense_fencing_parameter).to eq 4 }
  end

  describe '#fencing_master_modifier' do
    let(:character_weapon) { CharacterWeapon.new }

    before do
      character_weapon.stub_chain(:character, :character_background, :traits, :include?).and_return(true)
    end

    it { expect(character_weapon.fencing_master_modifier).to eq 5 }
  end

  describe '#two_weapons' do
    let(:character_weapon) { CharacterWeapon.new }
    let(:weapons) { [ build(:character_weapon) ] }

    before do
      character_weapon.stub_chain(:character, :character_weapons, :select).and_return { weapons }
      character_weapon.stub_chain(:character, :character_weapons) { weapons }
    end

    it { expect(character_weapon.two_weapons).to match_array weapons }
  end

  describe '#dual_wield_names' do
    pending
  end

  describe '#calculate_defense_bonus_for_dual_wield' do
    let(:character_weapon) { CharacterWeapon.new }
    let(:weapons) { [ build(:character_weapon) ] }

    #TODO test what's being passed to the yielded collection element or rewrite these specs to use factories
    context 'character is trained in dual wield' do
      before do
        character_weapon.stub_chain(:character, :skills, :map, :include?).and_return(true)
        character_weapon.stub(:two_weapons).and_return( weapons )
        weapons.stub_chain(:map, :sum) { 3 }
      end

      it { expect(character_weapon.calculate_defense_bonus_for_dual_wield).to eq 3 }
    end

    context 'character is not trained in dual wield' do
      before do
        character_weapon.stub_chain(:character, :skills, :map, :include?).and_return(false)
        character_weapon.stub(:two_weapons).and_return( weapons )
        weapons.stub_chain(:map, :first) { 3 }
      end

      it { expect(character_weapon.calculate_defense_bonus_for_dual_wield).to eq 3  }
    end
  end

  describe '#weapon_proficiency_bonus' do
    let(:character_weapon) { CharacterWeapon.new }

    context 'character is not trained for given weapon group' do
      before do
        character_weapon.stub_chain(:character, :character_weapon_proficiencies, :map, :include?).and_return(false)
        character_weapon.stub_chain(:resource, :group_name).and_return('text')
      end

      it { expect(character_weapon.weapon_proficiency_bonus).to eq -5 }
    end

    context 'character is trained' do
      before do
        character_weapon.stub_chain(:character, :character_weapon_proficiencies, :map, :include?).and_return(true)
        character_weapon.stub_chain(:resource, :group_name).and_return('text')
      end

      it { expect(character_weapon.weapon_proficiency_bonus).to eq 0 }
    end
  end

  describe '#total_defense' do
    let(:character_weapon) { CharacterWeapon.new }

    context 'dual wield is true' do
      before do
        character_weapon.stub(:defense_fencing_parameter) { 1 }
        character_weapon.stub_chain(:character, :statistics, :calculate_current_zr) { 15 }
        character_weapon.stub_chain(:character, :statistics, :calculate_wi) { 15 }
        character_weapon.stub(:special_defense_bonus_for_total_defense_listing) { 1 }
        character_weapon.stub(:calculate_defense_bonus_for_dual_wield) { 1 }
        character_weapon.stub(:weapon_proficiency_bonus) { 1 }
      end

      it { expect(character_weapon.total_defense(true, nil)).to eq 6 }
    end

    context 'dual wield is false, no shield, two handed weapon' do
      before do
        character_weapon.stub_chain(:character, :wield_style, :name).and_return('Styl walki jedną bronią (jednoręczną/dwuręczną)')
        character_weapon.stub(:defense_fencing_parameter) { 1 }
        character_weapon.stub(:calculate_defense_bonus_for_particular_weapon) { 1 }
        character_weapon.stub_chain(:character, :statistics, :calculate_current_zr) { 15 }
        character_weapon.stub_chain(:character, :statistics, :calculate_wi) { 15 }
        character_weapon.stub(:special_defense_bonus_for_total_defense_listing) { 1 }
        character_weapon.stub(:weapon_proficiency_bonus) { 1 }
      end

      it { expect(character_weapon.total_defense(false, nil)).to eq 6 }
    end

    context 'dual wield is false, character should use a shield, but he isnt ' do
      before do
        character_weapon.stub_chain(:character, :wield_style, :name).and_return('Styl walki bronią i tarczą')
        character_weapon.stub(:defense_fencing_parameter) { 1 }
        character_weapon.stub(:calculate_defense_bonus_for_particular_weapon) { 1 }
        character_weapon.stub_chain(:character, :statistics, :calculate_current_zr) { 15 }
        character_weapon.stub_chain(:character, :statistics, :calculate_wi) { 15 }
        character_weapon.stub(:special_defense_bonus_for_total_defense_listing) { 1 }
        character_weapon.stub(:weapon_proficiency_bonus) { 1 }
      end

      it { expect(character_weapon.total_defense(false, nil)).to eq 6 }
    end

    context 'dual wield is false, shield in use' do
      let(:character_shield) { create(:character_shield) }
      before do
        character_weapon.stub_chain(:character, :wield_style, :name).and_return('Styl walki bronią i tarczą')
        character_weapon.stub(:defense_fencing_parameter) { 1 }
        character_weapon.stub(:calculate_defense_bonus_for_particular_weapon) { 1 }
        character_weapon.stub_chain(:character, :statistics, :calculate_current_zr) { 15 }
        character_weapon.stub_chain(:character, :statistics, :calculate_wi) { 15 }
        character_weapon.stub(:special_defense_bonus_for_total_defense_listing) { 1 }
        character_weapon.stub(:weapon_proficiency_bonus) { 1 }
        character_shield.stub_chain(:character, :wield_style, :name).and_return('Styl walki bronią i tarczą')
      end

      it { expect(character_weapon.total_defense(false, character_shield)).to eq 9 }
    end
  end

  #TODO included methods
  describe '#collection_of_stats_modifiers' do

  end

  describe '#extract_bonus_from_stats_modifier_dsl_definition' do

  end

  describe '#sum_of_skill_preference_modifiers_for_weapon_or_weapon_group_specialisation' do

  end
end
