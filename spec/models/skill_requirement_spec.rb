# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SkillRequirement do
  describe '#skill_fails_to_meet_requirements' do
    let(:character) { Character.new }
    let(:skill_requirement) { SkillRequirement.new(check_applies_to: context, name: name, value: value) }

    context 'skill' do
      let(:context) { 'skill' }
      let(:name) { 'test' }
      let(:value) { 0 }

      context 'character has a required skill' do
        before do
          character.stub_chain(:skills, :map).and_return(['test', 'test2'])
        end

        it { expect(skill_requirement.skill_fails_to_meet_requirements(character, 20, 20, 20, 20, 20, 20)).to eq false }
      end

      context 'the required skill is missing' do
        before do
          character.stub_chain(:skills, :map).and_return(['test2'])
        end

        it { expect(skill_requirement.skill_fails_to_meet_requirements(character, 20, 20, 20, 20, 20, 20)).to eq true }
      end
    end


    context 'statistics' do
      let(:context) { 'statistics' }

      context 'character meets the stats requirement' do
        let(:value) { 19 }

        context 'single requirement' do
          let(:name) { 'INT' }

          it { expect(skill_requirement.skill_fails_to_meet_requirements(character, 20, 20, 20, 20, 20, 20)).to eq false }
        end


        context 'multi requirement' do
          let(:name) { 'OR: INT,WI' }

          context 'meets both' do
            it { expect(skill_requirement.skill_fails_to_meet_requirements(character, 20, 20, 20, 20, 20, 20)).to eq false }
          end

          context 'meets one' do
            it { expect(skill_requirement.skill_fails_to_meet_requirements(character, 20, 20, 20, 20, 5, 20)).to eq false }
          end
        end
      end

      context 'character does not meet the stats requirement' do
        let(:value) { 19 }

        context 'single requirement' do
          let(:name) { 'INT' }

          it { expect(skill_requirement.skill_fails_to_meet_requirements(character, 20, 20, 20, 18, 20, 20)).to eq true }
        end


        context 'multi requirement' do
          let(:name) { 'OR: INT,WI' }

          it { expect(skill_requirement.skill_fails_to_meet_requirements(character, 20, 20, 20, 18, 18, 20)).to eq true }
        end
      end
    end

    context 'experience' do
      let(:context) { 'experience' }
      let(:name) { 'test' }
      let(:value) { 0 }

      it { expect(skill_requirement.skill_fails_to_meet_requirements(character, 20, 20, 20, 20, 20, 20)).to eq true }
    end

    context 'social_class' do
      let(:context) { 'social_class' }
      let(:name) { 'is_elite?' }
      let(:value) { 0 }

      context 'character social class matches' do
        before do
          character.stub(:social_class) { SocialClass.new(name: 'Wielmoża') }
        end

        it { expect(skill_requirement.skill_fails_to_meet_requirements(character, 20, 20, 20, 20, 20, 20)).to eq false }
      end

      context 'character social class matches' do
        before do
          character.stub(:social_class) { SocialClass.new(name: 'Nieważne') }
        end

        it { expect(skill_requirement.skill_fails_to_meet_requirements(character, 20, 20, 20, 20, 20, 20)).to eq true }
      end
    end

    context 'caster_class' do
      let(:context) { 'caster_class' }
      let(:name) { 'test' }
      let(:value) { 0 }

      context 'character is a magic user' do
        before do
          character.stub_chain(:profession, :name) { 'Mag' }
        end

        it { expect(skill_requirement.skill_fails_to_meet_requirements(character, 20, 20, 20, 20, 20, 20)).to eq false }
      end

      context 'character is not a magic user' do
        before do
          character.stub_chain(:profession, :name) { 'Fircyk' }
        end

        it { expect(skill_requirement.skill_fails_to_meet_requirements(character, 20, 20, 20, 20, 20, 20)).to eq true }
      end
    end

    context 'auxiliary' do
      let(:context) { 'auxiliary' }
      let(:name) { 'Odporność na Ból' }

      context 'character has enough pain resistance' do
        let(:value) { 0 }

        before do
          character.stub_chain(:statistics, :calculate_pain_resistance) { 5 }
        end

        it { expect(skill_requirement.skill_fails_to_meet_requirements(character, 20, 20, 20, 20, 20, 20)).to eq false }
      end

      context 'character has not enough pain resistance' do
        let(:value) { 20 }

        before do
          character.stub_chain(:statistics, :calculate_pain_resistance) { 5 }
        end

        it { expect(skill_requirement.skill_fails_to_meet_requirements(character, 20, 20, 20, 20, 20, 20)).to eq true }
      end
    end

    context 'fighting' do
      let(:context) { 'fighting' }
      let(:name) { 'raw_fencing_when_defending' }
      let(:value) { 10 }

      context 'character has enough fencing' do
        before do
          character.stub_chain(:statistics, :raw_fencing_when_defending) { 15 }
        end

        it { expect(skill_requirement.skill_fails_to_meet_requirements(character, 20, 20, 20, 20, 20, 20)).to eq false }
      end

      context 'character has not enough fencing' do
        before do
          character.stub_chain(:statistics, :raw_fencing_when_defending) { 5 }
        end

        it { expect(skill_requirement.skill_fails_to_meet_requirements(character, 20, 20, 20, 20, 20, 20)).to eq true }
      end
    end
  end

  describe '#make_human_readable' do
    let(:character) { Character.new }
    let(:skill_requirement) { SkillRequirement.new(check_applies_to: context, name: name, value: value) }
    let(:name) { 'Whatever' }
    let(:value) { 10 }

    context 'skill' do
      let(:context) { 'skill' }
      let(:name) { 'Wiosłowanie' }

      it { expect(skill_requirement.make_human_readable).to eq "* Umiejętność Wiosłowanie" }
    end

    context 'statistics' do
      let(:context) { 'statistics' }

      context 'single requirement' do
        let(:name) { 'INT' }

        it { expect(skill_requirement.make_human_readable).to eq "* Parametr Inteligencja musi mieć wartość conajmniej 10" }
      end

      context 'multi requirement' do
        let(:name) { 'OR: INT,WI' }

        it { expect(skill_requirement.make_human_readable).to eq "* Jeden z Parametrów, INT lub WI powinien mieć wartość conajmniej 10" }
      end
    end

    context 'experience' do
      let(:context) { 'experience' }

      it { expect(skill_requirement.make_human_readable).to eq "* Poziom doświadczenia: 10" }
    end

    context 'social_class' do
      let(:context) { 'social_class' }

      it { expect(skill_requirement.make_human_readable).to eq "* Postać musi mieć odpowiednie pochodzenie. Zerknij do podręcznika" }
    end

    context 'caster_class' do
      let(:context) { 'caster_class' }

      it { expect(skill_requirement.make_human_readable).to eq "* Postać musi być Posiadaczem Mocy" }
    end

    context 'auxiliary' do
      let(:context) { 'auxiliary' }

      it { expect(skill_requirement.make_human_readable).to eq "* Paramter Whatever musi wynosić conajmniej 10" }
    end
  end
end
