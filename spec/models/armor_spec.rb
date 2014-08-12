# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Armor do
  subject { described_class.new }

  describe '#is_rare_or_exotic?' do
    before do
      subject.stub(:group_name) { 'Pancerze i Zbroje Egzotyczne' }
    end

    it { expect(subject.is_rare_or_exotic?).to be_true}
  end

  describe '#name_with_price' do
    before do
      subject.stub(:name) { 'Something' }
      subject.stub(:price) { 3000 }
    end

    it { expect(subject.name_with_price).to eq 'Something - 30,0 sztuk złota'}
  end

  describe '#character_can_use?' do
    let(:character) { double }
    let(:statistics_hash) { { 'strength' => 2 } }

    before do
      subject.stub_chain(:armament_requirements, :all?).and_return(true)
    end

    it { expect(subject.character_can_use?(character, statistics_hash)).to be_true}
  end
end
