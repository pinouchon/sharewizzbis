
FactoryGirl.define do
  factory :user do
    #sequence(:email) { |n| "bob#{n}@domain.com" }
    email 'bob@domain.com'
    password  "12345678"
  end
end