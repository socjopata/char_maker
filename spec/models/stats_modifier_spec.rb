# -*- encoding : utf-8 -*-
require 'spec_helper'

describe StatsModifier do
  describe '.belongs_to_social_class' do
    let(:social_class) { create(:social_class) }
    let(:stats_choice) { create(:stats_choice, resource: social_class) }
    let!(:stats_modifier) { create(:stats_modifier, stats_choice: stats_choice) }

    it { expect(StatsModifier.belongs_to_social_class(social_class.id)).to eq [stats_modifier] }
  end

  describe '.default_for_social_class' do
    let(:social_class) { create(:social_class) }
    let(:stats_choice) { create(:stats_choice, resource: social_class) }
    let!(:stats_modifier) { create(:stats_modifier, stats_choice: stats_choice, default_for_social_class: true) }

    it { expect(StatsModifier.default_for_social_class(social_class.id)).to eq [stats_modifier] }
  end

  describe '.must_choose_for_social_class' do
    let(:social_class) { create(:social_class) }
    let(:stats_choice) { create(:stats_choice, resource: social_class) }
    let!(:stats_modifier) { create(:stats_modifier, stats_choice: stats_choice, default_for_social_class: false) }

    it { expect(StatsModifier.must_choose_for_social_class(social_class.id)).to eq [stats_modifier] }
  end

  describe '.must_choose_for_origin' do
    let(:country) { create(:country) }
    let(:stats_choice) { create(:stats_choice, resource: country) }
    let!(:stats_modifier) { create(:stats_modifier, stats_choice: stats_choice, default_for_origin: false) }

    it { expect(StatsModifier.must_choose_for_origin(country.id)).to eq [stats_modifier] }
  end

  describe '.bonus_preferences_for' do
    let(:character_skill) { create(:character_skill) }
    let!(:skill_bonus_preference) { create(:skill_bonus_preference, character_skill: character_skill) }
    let(:stats_choice) { create(:stats_choice, resource: character_skill.skill) }
    let!(:stats_modifier) { create(:stats_modifier, stats_choice: stats_choice) }
    let(:choice_name) { 'Strzelecka Łuki Refleksyjne' }

    it { expect(StatsModifier.bonus_preferences_for(character_skill.character.id, choice_name)).to eq [stats_modifier] }
  end
end

