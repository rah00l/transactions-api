FactoryGirl.define do
  factory :consumer do
    first_name { Faker::Lorem.word }
    last_name { Faker::Lorem.word }
  end
end
