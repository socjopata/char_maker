FactoryGirl.define do
  factory :user do
    email 'dude@o2.pl'
    admin false
    password 'foobar'
    password_confirmation 'foobar'
  end

  factory :admin, class: User do
    email 'admin@o2.pl'
    admin true
    password 'foobar'
    password_confirmation 'foobar'
  end
end