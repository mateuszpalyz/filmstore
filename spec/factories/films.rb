FactoryGirl.define do
  factory :film do
    title "MyString"
    description "MyText"
    released_at "2017-09-20"
    user nil
    director nil
  end
end
