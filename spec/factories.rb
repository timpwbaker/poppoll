FactoryGirl.define do
  factory :user do
    name "Tom Jones"
    email "tomjones@email.com"
    password "Password"

    trait :guest do
      email "guest@pop-poll.herokuapp.com"
    end
  end

  factory :option do
    body "Option 1"
  end

  factory :poll do
    user { User.guest }
    question "What I really want to know is"
    options { [FactoryGirl.build(:option, body: "Option 1"),
               FactoryGirl.build(:option, body: "Option 2")] }
  end

end
