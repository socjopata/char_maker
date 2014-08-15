require 'spec_helper'

describe Trait do
  describe '#statistics_it_affects' do
    let(:trait) { Trait.new }

    before do
      trait.stub_chain(:stats_choices, :first, :stats_modifiers, :first, :modifies).and_return('ZR')
    end

    it { expect(trait.statistics_it_affects).to eq 'ZR' }
  end
end
