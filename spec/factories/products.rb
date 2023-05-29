FactoryBot.define do
  factory :product do
    name {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    explain {Faker::Lorem.sentence}
    association :user 
    category_id           {2}
    status_id             {2}
    shipping_cost_id      {2}
    shipping_date_id      {2}
    region_id             {2}
    price                 {5000}
  end
end