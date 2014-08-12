require 'spec_helper'

describe ArmamentRequirement do
  subject { described_class.new }
  let(:character) { double }
  let(:statistics_hash) { { 'strength' => 2 } }

  describe '#is_met_by?' do
    context 'statistics' do
      before do
        subject.stub(:check_applies_to) { 'statistics' }
        subject.stub(:value) { 1 }
        subject.stub(:name) { 'strength' }
      end

      it { expect(subject.is_met_by?(character, statistics_hash)).to be_true }
    end

    context 'fightstyle' do
      before do
        subject.stub(:check_applies_to) { 'fightstyle' }
        subject.stub(:name) { 'brutal' }
        character.stub_chain(:fight_style, :name).and_return('brutal')
      end

      it { expect(subject.is_met_by?(character, statistics_hash)).to be_true }
    end

    context 'modified_stat' do
      before do
        subject.stub(:check_applies_to) { 'modified_stat' }
        subject.stub(:value) { 1 }
        subject.stub(:name) { 'calculate_current_zr' }
        character.stub_chain(:statistics, :calculate_current_zr).and_return(2)
      end

      it { expect(subject.is_met_by?(character, statistics_hash)).to be_true }
    end

    context 'social_class' do
      before do
        subject.stub(:check_applies_to) { 'social_class' }
        subject.stub(:name) { 'is_elite?' }
        character.stub_chain(:social_class, :is_elite?).and_return(true)
      end

      it { expect(subject.is_met_by?(character, statistics_hash)).to be_true }
    end

    context 'origin' do
      before do
        subject.stub(:check_applies_to) { 'origin' }
        subject.stub(:name) { 'Poland' }
        character.stub_chain(:character_background, :country, :name).and_return('Poland')
      end

      it { expect(subject.is_met_by?(character, statistics_hash)).to be_true }
    end
  end
end



