# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Spellbook do

  describe '#draw_spells' do
    #TODO too much hassle to write specs, before actual refactoring
  end

  describe '#picked_by_player' do
    let(:spellbook) { Spellbook.new(randomly_drawn_spells: [11, 5, 2]) }

    it { expect(spellbook.picked_by_player).to eq 0 }
  end
end
