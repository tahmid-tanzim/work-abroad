FactoryGirl.define do
  factory :member do
    name "John Doe"
    national_id 12345678907654321
    email "tahmid.tanzim@live.com"
    password "FooBar@123"
    password_confirmation "FooBar@123"
  end
end