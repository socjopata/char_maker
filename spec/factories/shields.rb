# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :shield, class: Shield do
    group_name 'Tarcze Piechoty'
    name 'Puklerz testowy'
    defense_bonus 3
    special_rules ''
    price 700
    dexterity_nerf 0
    dexterity_cap 33
  end
end
