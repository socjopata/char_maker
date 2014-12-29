# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :weapon, class: Weapon do
    group_name 'Pazur Sirtol'
    name 'Kieł Sirtol'
    weapon_type 'DW'
    range 'D'
    speed '7'
    cutting_dmg 13
    pierce_dmg 9
    crushing_dmg 0
    attack_bonus 3
    defense_bonus 6
    special_rules 'Krytyk 29-30, Walcząc na zasięgu długim przeciw bro...'
    price 2700
  end
end
