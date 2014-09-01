# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Statistics do
  let(:initial_stats_count) { 6 }
  let(:minimum_accepted_stats_sum) { 55 }

  describe 'draw_stats' do
    context 'trait is not present' do
      let(:statistics) { Statistics.new }

      before do
        statistics.stub_chain(:character, :character_background, :traits, :first, :name).and_return('text')
        statistics.draw_stats
      end

      it { expect(statistics.initial_dice_roll_set.length).to eq initial_stats_count }
      it { expect(statistics.initial_dice_roll_set.sum).to be > minimum_accepted_stats_sum }
    end

    context 'trait equals to <<Błogosławiony>>' do
      #tested at .normalize_dice_rolls
    end

    context 'trait equals to <<Piękniś>>' do
      let(:statistics) { Statistics.new }
      let(:pretty_face_value) { 25 }

      before do
        statistics.stub_chain(:character, :character_background, :traits, :first, :name).and_return('Piękniś')
        statistics.draw_stats
      end

      it { expect(statistics.initial_dice_roll_set.last).to eq pretty_face_value }
    end
  end

  describe '.normalize_dice_rolls' do
    let(:roll_set) { [20, 19, 18, 17, 16, 15, 14] }

    describe 'character is not blessed' do
      let(:blessed) { false }
      let(:modified_roll_set) { [19, 18, 17, 16, 15] }

      it { expect(Statistics.normalize_dice_rolls(roll_set, blessed)).to eq modified_roll_set }
    end

    describe 'character is blessed' do
      let(:blessed) { true }
      let(:modified_roll_set) { [20, 19, 18, 17, 16] }

      it { expect(Statistics.normalize_dice_rolls(roll_set, blessed)).to eq modified_roll_set }
    end
  end

  describe '#push_social_class_stats_modifiers' do
    let(:statistics) { Statistics.new }
    let(:params) { double }

    before do
      statistics.stub(:push_stats).and_return(true)
    end

    it { expect(statistics.push_social_class_stats_modifiers(params)).to be_true }
  end

  describe '#push_origin_stats_modifiers' do
    let(:statistics) { Statistics.new }
    let(:params) { double }

    before do
      statistics.stub(:push_stats).and_return(true)
    end

    it { expect(statistics.push_origin_stats_modifiers(params)).to be_true }
  end

  describe '#push_stats' do
    let(:statistics) { Statistics.new }
    let(:params) { {stats_choice.id => 'Inteligencja'} }
    let(:stats_choice) { create(:stats_choice) }
    let!(:stats_modifier) { create(:stats_modifier, stats_choice: stats_choice) }

    before do
      statistics.push_stats(params)
    end

    it { expect(statistics.stats_modifiers).to eq [stats_modifier] }
  end

  describe '#push_profession_modifiers' do
    let(:statistics) { Statistics.new }
    let(:stats_modifiers) { [create(:stats_modifier, modifies: 'skills', group_name: 'Czytanie i Pisanie')] }

    before do
      statistics.stub_chain(:character, :profession, :stats_choices, :collect).and_return(stats_modifiers)
    end

    it { expect(statistics.push_profession_modifiers).to eq [stats_modifiers.first.group_name] }
  end

  describe '#convert_stat_choices_to_skills' do
    let(:statistics) { Statistics.new }
    let(:character) { create(:character) }
    let!(:stats_modifiers) { [create(:stats_modifier, modifies: 'skills', group_name: 'test skill')] }
    let!(:skill) { create(:skill, name: 'test skill') }

    before do
      statistics.stub_chain(:character, :id) { character.id }
      statistics.stub_chain(:character, :profession, :skill_points).and_return(1)
      statistics.stats_modifiers << stats_modifiers
    end

    it { expect(statistics.convert_stat_choices_to_skills).to eq [1, [skill.id]] }
  end

  describe '#calculate_weapon_class_proficiencies_points' do
    let(:statistics) { Statistics.new }

    before do
      statistics.stub_chain(:character, :profession, :starting_weapon_proficiency).and_return(1)
    end

    it { expect(statistics.calculate_weapon_class_proficiencies_points).to eq 1 }
  end
end