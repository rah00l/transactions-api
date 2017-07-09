FactoryGirl.define do
  factory :merchant do
    name { Faker::Lorem.word }
    domain { Faker::Lorem.word }
  end
end
