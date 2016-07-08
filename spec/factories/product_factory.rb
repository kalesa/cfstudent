FactoryGirl.define do
  factory :product, class: Product do
    name 'Test Product'
    price 1000  
  end
end

@product = FactoryGirl.create(:product, name: 'My Name', price: 500)