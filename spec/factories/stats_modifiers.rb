# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :stats_modifier, class: StatsModifier do
    stats_choice { create(:stats_choice) }
    modifies 'ZR'
    value 2
    evaluated_instruction nil
    group_name 'domyślne'
    default_for_social_class nil
    default_for_origin nil
  end
end
