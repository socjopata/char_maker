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
end
