FactoryGirl.define do
  factory :comment do
    body 'Test comment'
    rating 3
    association :product, factory: :product
    association :user, factory: :user
  end
end

FactoryGirl.create(:comment, user: @user, product: @product, body: 'Hi', rating: 4)