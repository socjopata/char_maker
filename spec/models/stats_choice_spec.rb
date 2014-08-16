require 'spec_helper'

describe StatsChoice do
  describe '.default' do
    let(:default_resource) { double }

    before { allow(StatsChoice).to receive(:default).and_return(default_resource) }

    it { expect(StatsChoice.default).to eq default_resource }
  end
end