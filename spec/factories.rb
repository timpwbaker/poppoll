FactoryGirl.define do
  factory :option do
    body "MyText"
    poll nil
  end
  factory :user do
    name "Tom Jones"
    email "tomjones@email.com"
    password "Password"
  end
end
