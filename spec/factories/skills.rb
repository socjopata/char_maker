FactoryGirl.define do
  factory :skill, class: Skill do
    profession_type 'scholar'
    name 'Zakazana Wiedza'
    way_it_works nil
    description nil
    limitations nil
  end
end