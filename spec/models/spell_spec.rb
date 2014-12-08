# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Spell do
  describe '#to_s' do
    let(:spell) { Spell.new(name: name) }
    let(:name) { 'test' }

    it { expect(spell.to_s).to eq name }
  end

  describe '.set_for' do
    let(:character) { Character.new }

    context 'mage' do
      before do
        character.stub_chain(:profession, :name).and_return('Mag')
      end

      it do
        Spell.should_receive(:mage).once
        Spell.set_for(character)
      end
    end

    context 'shaman' do
      before do
        character.stub_chain(:profession, :name).and_return('Szaman')
        character.stub_chain(:character_background, :deity, :id)
      end

      it do
        Spell.should_receive(:shaman).once
        Spell.set_for(character)
      end
    end

    context 'cleric' do
      before do
        character.stub_chain(:profession, :name).and_return('Kapłan')
        character.stub_chain(:character_background, :deity, :id)
      end

      it do
        Spell.should_receive(:cleric).once
        Spell.set_for(character)
      end
    end

    context 'warlock' do
      before do
        character.stub_chain(:profession, :name).and_return('Czarnoksiężnik')
      end

      it do
        Spell.should_receive(:warlock).once
        Spell.set_for(character)
      end
    end

    context 'alchemist' do
      before do
        character.stub_chain(:profession, :name).and_return('Alchemik')
      end

      it do
        Spell.should_receive(:alchemist).once
        Spell.set_for(character)
      end
    end
  end
end
