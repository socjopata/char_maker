FactoryGirl.define do
  factory :character_skill, class: CharacterSkill do
    character { create(:character) }
    skill { create(:skill) }
  end
end