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

    it {expect(statistics.push_social_class_stats_modifiers(params)).to be_true}
  end

  describe '#push_origin_stats_modifiers' do
    let(:statistics) { Statistics.new }
    let(:params) { double }

    before do
      statistics.stub(:push_stats).and_return(true)
    end

    it {expect(statistics.push_origin_stats_modifiers(params)).to be_true}
  end
end
