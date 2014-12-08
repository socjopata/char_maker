# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Skill do
  describe '.fetch_caste_skills_for' do
    let(:character) { Character.new }

    context 'scholar' do
      before do
        character.stub_chain(:profession, :general_type).and_return('scholar')
      end

      it do
        Skill.should_receive(:fetch_for_type).with('scholar').once
        Skill.fetch_caste_skills_for(character)
      end
    end

    context 'rogue' do
      before do
        character.stub_chain(:profession, :general_type).and_return('rogue')
      end

      it do
        Skill.should_receive(:fetch_for_type).with('rogue').once.and_return([])
        Skill.should_receive(:fetch_for_type).with('finesse').once.and_return([])
        Skill.should_receive(:fetch_for_type).with('shooter').once.and_return([])
        Skill.fetch_caste_skills_for(character)
      end
    end

    context 'soldier' do
      before do
        character.stub_chain(:profession, :general_type).and_return('soldier')
        character.stub_chain(:fight_style, :name).and_return('Finezyjny')
      end

      it do
        Skill.should_receive(:fetch_for_type).with('soldier').once.and_return([])
        Skill.should_receive(:fetch_for_type).with('finesse').once.and_return([])
        Skill.should_receive(:fetch_for_type).with('shooter').once.and_return([])
        Skill.fetch_caste_skills_for(character)
      end
    end
  end

  describe '.fetch_profession_skills_for' do
    let(:character) { Character.new }

    before do
      character.stub_chain(:profession, :name).and_return('Fircyk')
    end

    it do
      Skill.should_receive(:fetch_for_type).with('Fircyk').once
      Skill.fetch_profession_skills_for(character)
    end
  end

  describe '.filter_nonselectable' do
    let(:character) { Character.new }
    let(:skills) do
      skill = Skill.new
      skill.skill_requirements << SkillRequirement.new(check_applies_to: 'experience', name: 'test', value: 1)
      skill2 = Skill.new
      skill2.skill_requirements << SkillRequirement.new(check_applies_to: 'caster_class', name: 'test', value: 1)
      [skill, skill2]
    end

    before do
      character.stub_chain(:profession, :name).and_return('Mag')
    end

    it { expect(Skill.filter_nonselectable(skills, character, 20, 20, 20, 20, 20, 20)).to eq [skills[0]] }
  end

  describe '.change' do
    let(:character) { Character.new }
    let(:skill) { Skill.new }
    let(:action) { true }
    let(:commander) { double('commander') }

    before do
      character.stub_chain(:statistics, :calculate_s) { 20 }
      character.stub_chain(:statistics, :calculate_zr) { 20 }
      character.stub_chain(:statistics, :calculate_wt) { 20 }
      character.stub_chain(:statistics, :calculate_int) { 20 }
      character.stub_chain(:statistics, :calculate_wi) { 20 }
      character.stub_chain(:statistics, :calculate_o) { 20 }
      character.stub(:reload)
    end

    it do
      Skill.should_receive(:basic).once.and_return([])
      Skill.should_receive(:fetch_caste_skills_for).once.and_return([])
      Skill.should_receive(:fetch_profession_skills_for).once.and_return([])
      Skill.should_receive(:filter_nonselectable).once.and_return([])
      CharacterSkill.should_receive(:exists?).once.and_return(true)
      Commander.should_receive(:new).once.and_return { commander }
      commander.should_receive(:do!).once

      Skill.change(character, skill, action)
    end
  end

  describe '.calculate_free_skill_amount' do
    let(:character) { Character.new }

    context 'character has Amnezja trait' do
      before do
        character.stub_chain(:character_background, :traits, :first, :name) { 'Amnezja' }
      end

      it { expect(Skill.calculate_free_skill_amount(character, 2, 0, 0)).to eq 0 }
    end

    context 'character does not have Amnezja trait' do
      before do
        character.stub_chain(:character_background, :traits, :first, :name) { 'test' }
      end

      it { expect(Skill.calculate_free_skill_amount(character, 2, 0, 0)).to eq 2 }
    end

    context 'the calculation result is negative' do
      before do
        character.stub_chain(:character_background, :traits, :first, :name) { 'test' }
      end

      it { expect(Skill.calculate_free_skill_amount(character, 2, 0, 3)).to eq 0 }
    end
  end

  describe '#add_skill_for' do
    let(:skill) { Skill.create(name: 'test') }
    let(:character_id) { 1 }

    it { expect { skill.add_skill_for(character_id) }.to change { CharacterSkill.count }.by 1 }
  end

  describe '#substract_skill_from' do
    let(:skill) { Skill.create(name: 'test') }
    let(:character_id) { 1 }
    let!(:character_skill) { CharacterSkill.create(skill_id: skill.id, character_id: character_id)}

    it { expect { skill.substract_skill_from(character_id) }.to change { CharacterSkill.count }.by -1 }
  end
end
