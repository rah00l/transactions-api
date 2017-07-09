FactoryGirl.define do
  factory :transaction do
    sale_amount { Faker::Number.number(2) }
    date { Faker::Number.number(10) }
  end
end
