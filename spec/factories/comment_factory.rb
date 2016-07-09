FactoryGirl.define do
  factory :comment do
    body 'Test comment'
    rating 3
    association :product, factory: :product
    association :user, factory: :user
  end
end
