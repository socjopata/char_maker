# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Shield do
  subject { described_class.new }

  describe '#ranged_defense_bonus' do
    before do
      subject.stub_chain(:stats_choices, :first, :stats_modifiers, :where, :first) { StatsModifier.new(value: 1) }
    end

    it { expect(subject.ranged_defense_bonus).to eq 1}
  end
end
