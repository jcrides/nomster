FactoryGirl.define do
  factory :place do
    name "A Restaurant"
    address "1 Market St, San Francisco, CA 94105"
    description "A nice place"
    user
  end

  factory :user do
    sequence(:email) { |n| "guy#{n}@emailbistro.com" }
    password "thepassword"
    password_confirmation "thepassword"
  end

  factory :comment do
    message "this place rocks"
    rating "4"
    place
  end

end
