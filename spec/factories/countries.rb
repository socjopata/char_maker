FactoryGirl.define do
  factory :country, class: Country do
    name 'not blank'
    description nil
    c_type 'civilized'
  end
end