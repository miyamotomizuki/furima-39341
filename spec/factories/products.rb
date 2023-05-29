FactoryBot.define do
  factory :product do
    name {Faker::Lorem.sentence}
    explain {Faker::Lorem.sentence}
    association :user 
    category_id           {2}
    status_id             {2}
    shipping_cost_id      {2}
    shipping_date_id      {2}
    region_id             {2}
    price                 {5000}

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test-sample.png'), filename: 'test-sample.png')
    end
  end
end