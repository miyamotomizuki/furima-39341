FactoryBot.define do
  factory :purchase_buyer do
    post_code { '123-4567' }
    region_id { "2" }
    city { '東京都北区' }
    block { '十条1-1' }
    building { 'ハイムス' }
    phone { '08012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end