FactoryGirl.define do
  factory :user do
    name     "Alexander L"
    email    "alexanderl@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end