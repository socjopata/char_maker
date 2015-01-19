# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Character do
  let(:character) { Character.new }

  describe '#set_session' do
    before { character.session = { something: 1 } }

    it { expect { character.set_session }.to change { character.session }.to({}) }
  end

  describe '#any_unfinished_matters_present?' do
    let(:stats_modifier) { StatsModifier.new }

    before do
      character.stub(:skill_choices_to_be_precised) { [stats_modifier] }
      stats_modifier.stub_chain(:as_character_skill, :skill_bonus_preference, :blank?).and_return(false)
    end

    it { expect(character.any_unfinished_matters_present?).to eq false }
  end

  describe '#skill_choices_to_be_precised' do
    let(:stats_modifier) { StatsModifier.new }

    before do
      character.stub_chain(:statistics, :stats_modifiers) { [stats_modifier] }
      stats_modifier.stub_chain(:group_name, :match).and_return(false)
    end

    it { expect(character.skill_choices_to_be_precised).to eq [] }
  end

  describe '#make_rogue_a_finesse_fighter' do
    let(:fightstyle) { FightStyle.new }

    context 'update should happen' do
      it do
        character.stub_chain(:profession, :present?).and_return(true)
        character.stub_chain(:profession, :general_type).and_return('rogue')
        character.stub(:update_attribute)
        fightstyle.stub(:id)
        allow(FightStyle).to receive(:find_by_name).and_return(fightstyle)
        character.make_rogue_a_finesse_fighter
      end
    end

    context 'update shouldnt happen' do
      it do
        character.stub_chain(:profession, :present?).and_return(false)
        character.make_rogue_a_finesse_fighter
      end
    end
  end

  describe '#check_fight_style_choice' do
    context 'style choice is invalid' do
      before do
        character.stub(:fight_style_id_changed?) { true }
        character.stub(:style_invalid?) { true }
      end

      it { expect(character.check_fight_style_choice).to eq false }
    end

    context 'style choice is valid' do
      before do
        character.stub(:fight_style_id_changed?) { false }
        character.stub(:style_invalid?) { true }
      end

      it { expect(character.check_fight_style_choice).to eq true }
    end
  end

  describe '#style_invalid?' do
    context 'invalid for brutal' do
      before do
        character.stub_chain(:fight_style, :name).and_return('Brutalny')
        character.stub_chain(:statistics, :calculate_s).and_return(15)
        character.stub_chain(:statistics, :calculate_zr).and_return(20)
      end

      it { expect(character.style_invalid?).to eq true }
    end

    context 'invalid for finesse' do
      before do
        character.stub_chain(:fight_style, :name).and_return('Finezyjny')
        character.stub_chain(:statistics, :calculate_s).and_return(20)
        character.stub_chain(:statistics, :calculate_zr).and_return(15)
      end

      it { expect(character.style_invalid?).to eq true }
    end

    context 'valid' do
      before do
        character.stub_chain(:fight_style, :name).and_return('Finezyjny')
        character.stub_chain(:statistics, :calculate_s).and_return(15)
        character.stub_chain(:statistics, :calculate_zr).and_return(20)
      end

      it { expect(character.style_invalid?).to eq false }
    end
  end

  describe '#pick_a_profession' do
    it do
      character.stub(:create_character_profession)
      character.pick_a_profession(1)
    end
  end

  describe '#social_class_stats_choices' do
    it do
      character.stub_chain(:character_background, :social_classes, :first, :stats_choices)
      character.social_class_stats_choices
    end
  end

  describe '#social_class_stats_choices' do
    it do
      character.stub_chain(:character_background, :social_classes, :first)
      character.social_class
    end
  end

  describe '#default_origin_modifiers_set' do
    it do
      character.stub_chain(:character_background, :country, :stats_choices, :find_by_applies_to)
      character.stub_chain(:profession, :general_type)
      character.default_origin_modifiers_set
    end
  end
end
