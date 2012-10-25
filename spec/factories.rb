# -*- encoding : utf-8 -*-
require 'ffaker'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    admin false
    password "foobar"
    password_confirmation "foobar"
  end

  factory :admin, class: User do
    email { Faker::Internet.email }
    admin true
    password "foobar"
    password_confirmation "foobar"
  end

  factory :character do
    user
    name "test_character"
    gender "Mężczyzna"
    easy_deity_picking true
    hardcore_trait_picking false
    hardcore_social_class_picking false
    session {}
  end

end

