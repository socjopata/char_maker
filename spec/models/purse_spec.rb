# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Purse do
  describe '#close_the_bill' do
    subject { described_class.new(current: 100) }

    context 'amount to close is less than current' do
      let(:amount_after_shopping) { 99 }

      it do
        subject.should_receive(:update_attribute).with(:base, amount_after_shopping).once
        subject.close_the_bill(amount_after_shopping)
      end
    end

    context 'amount to close is bigger than current' do
      let(:amount_after_shopping) { 100 }

      it do
        subject.should_receive(:update_attribute).with(:base, subject.current).once
        subject.close_the_bill(amount_after_shopping)
      end
    end
  end

  describe '#update_current' do
    subject { described_class.new(current: 100, base: 100, starting: 100) }
    let(:money_bonuses) { Array.new }

    before do
      subject.stub_chain(:character, :statistics, :stats_modifiers, :select).and_return(money_bonuses)
      money_bonuses.stub(:select) { Array.new }
    end

    it do
      subject.should_receive(:parse_variable_part).once.and_return(0)
      subject.should_receive(:update_attribute).once
      expect(subject.update_current).to eq(subject.current + subject.base)
    end
  end

  describe '#parse_variable_part' do
    let(:variable_money_bonus_stats_modifiers) do
      [StatsModifier.new(modifies: 'money', value: 0, group_name: '1k4c+1')]
    end

    it { expect(subject.parse_variable_part(variable_money_bonus_stats_modifiers)).to be_within(3).of(2) }
  end

  describe '#extract_multiplier' do
    subject { described_class.new }

    context 'g' do
      let(:base) { 'g' }

      it { expect(subject.extract_multiplier(base)).to eq 100 }
    end

    context 's' do
      let(:base) { 's' }

      it { expect(subject.extract_multiplier(base)).to eq 10 }
    end

    context 'c' do
      let(:base) { 'c' }

      it { expect(subject.extract_multiplier(base)).to eq 1 }
    end
  end
end
