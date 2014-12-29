# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :character_weapon, class: CharacterWeapon do
    character { create(:character) }
    weapon { create(:weapon) }
    speed nil
    damage nil
    attack_bonus nil
    defense_bonus nil
  end
end
