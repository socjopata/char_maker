# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :character, class: Character do
    user
    name 'not blank'
    description nil
    gender { 'Mężczyzna' }
    finished nil
    free_skill_points_left nil
    easy_deity_picking true
    avatar nil
    hardcore_trait_picking false
    hardcore_social_class_picking false
    lead_parameter 'S'
    fight_style_id nil
    wield_style_id nil
    session { {} }
  end
end