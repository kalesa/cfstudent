# This will guess the User class
FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }
  factory :user do
    email
    password "Maharlika0"
    admin false
    first_name "Mickey"
    last_name "Mouse"
end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email
    password "Maharlika0"
    password_confirmation { |u| u.password }
    admin true
    first_name "Admin"
    last_name "User"
  end
end