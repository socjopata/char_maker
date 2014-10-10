# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :character_shield, class: CharacterShield do
    character { create(:character) }
    shield { create(:shield) }
    dexterity_nerf false
    dexterity_cap false
    defense_bonus false
    favorite false
  end
end
