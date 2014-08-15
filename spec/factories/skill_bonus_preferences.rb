# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :skill_bonus_preference, class: SkillBonusPreference do
    character_skill { create(:character_skill) }
    choice 'Strzelecka Łuki Refleksyjne'
  end
end