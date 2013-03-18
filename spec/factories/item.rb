FactoryGirl.define do
  factory :item do
    sequence(:title) { |n| "object #{n}" }
    sequence(:description) { |n| "description #{n}" }
    user
  end
end