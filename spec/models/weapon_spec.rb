require 'spec_helper'

describe Weapon do
  subject { described_class.new }

  describe '#name_with_price' do
    it_behaves_like '#name_with_price'
  end

  describe '#character_can_use?' do
    it_behaves_like '#character_can_use?'
  end
end