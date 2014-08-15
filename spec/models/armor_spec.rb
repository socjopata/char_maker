# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Armor do
  subject { described_class.new }

  describe '#is_rare_or_exotic?' do
    before do
      subject.stub(:group_name) { 'Pancerze i Zbroje Egzotyczne' }
    end

    it { expect(subject.is_rare_or_exotic?).to be_true }
  end

  describe '#name_with_price' do
    it_behaves_like '#name_with_price'
  end

  describe '#character_can_use?' do
    it_behaves_like '#character_can_use?'
  end
end
