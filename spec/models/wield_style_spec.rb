require 'spec_helper'

describe WieldStyle do
  describe '#to_s' do
    let(:wield_style) { WieldStyle.new(name: fancy_name) }
    let(:fancy_name) { 'fancy name' }

    it { expect(wield_style.to_s).to eq fancy_name }
  end
end