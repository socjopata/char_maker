# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CharacterBackground do
  let(:character_background) { CharacterBackground.new }

  describe '#draw_a_trait' do
    context 'new record' do
      #TODO need to rewrite method first
    end

    context 'existing record' do
      before { character_background.stub(:new_record?) { false } }

      it { expect(character_background.draw_a_trait).to eq nil }
    end
  end

  describe '#attach_a_curse' do
    it 'attaches a proper curse' do
      character_background.stub(:traits) { [] }
      allow(Trait).to receive(:find_by_name).with('Schizofrenik')
      character_background.attach_a_curse(1)
    end
  end

  describe '#attach_a_blessing' do
    it 'attaches a proper curse' do
      character_background.stub(:traits) { [] }
      allow(Trait).to receive(:find_by_name).with('Piękniś')
      character_background.attach_a_blessing(1)
    end
  end

  describe '#set_origin' do
    it 'calls create origin' do
      character_background.stub(:create_origin)
      character_background.set_origin(country_id: 1)
    end
  end

  describe '#set_social_class' do
    context 'civilized origin' do
      it 'attach a civilized origin' do
        character_background.stub_chain(:country, :c_type).and_return('civilized')
        character_background.stub(:attach_civilized_origin)
        character_background.set_social_class
      end
    end

    context 'barbarian origin' do
      it 'attach a barbarian origin' do
        character_background.stub_chain(:country, :c_type).and_return('whatever')
        character_background.stub(:attach_barbarian_origin)
        character_background.set_social_class
      end
    end
  end

  describe '#attach_civilized_origin' do
    context 'character profession implies noble origin' do
      it 'assigns a default noble class' do
        character_background.stub_chain(:character, :profession, :name).and_return('Rycerz')
        character_background.stub(:social_classes) { [] }
        allow(SocialClass).to receive(:find_by_name).with('Szlachcic Zaściankowy')
        character_background.attach_civilized_origin
      end
    end

    context 'user feels lucky and wants hardcore origin picking' do
      it 'assigns a randomly picked class' do
        character_background.stub_chain(:character, :profession, :name).and_return('whatever')
        character_background.stub_chain(:character, :hardcore_social_class_picking?).and_return(true)
        character_background.stub(:social_classes) { [] }
        allow(SocialClass).to receive(:find_by_name)
        character_background.attach_civilized_origin
      end
    end

    context 'default' do
      it 'assigns a randomly picked class' do
        character_background.stub_chain(:character, :profession, :name).and_return('whatever')
        character_background.stub_chain(:character, :hardcore_social_class_picking?).and_return(false)
        character_background.stub(:social_classes) { [] }
        allow(SocialClass).to receive(:find_by_name).with('Mieszczanin')
        character_background.attach_civilized_origin
      end
    end
  end

  describe '#attach_barbarian_origin' do
    context 'user feels lucky and wants hardcore origin picking' do
      it 'assigns a randomly picked class' do
        character_background.stub_chain(:character, :hardcore_social_class_picking?).and_return(true)
        character_background.stub(:social_classes) { [] }
        allow(SocialClass).to receive(:find_by_name)
        character_background.attach_barbarian_origin
      end
    end

    context 'default' do
      it 'assigns a randomly picked class' do
        character_background.stub_chain(:character, :hardcore_social_class_picking?).and_return(false)
        character_background.stub(:social_classes) { [] }
        allow(SocialClass).to receive(:find_by_name).with('Wojownik')
        character_background.attach_barbarian_origin
      end
    end
  end

  describe '#fill_the_purse_with_gold' do
    before do
      character_background.stub_chain(:social_classes, :first, :name).and_return('Niewolnik')
      character_background.stub_chain(:character, :create_purse)
    end

    it { expect(character_background.fill_the_purse_with_gold).to eq nil }
  end
end
