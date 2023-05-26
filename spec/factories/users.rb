FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {person.first.kanji}
    first_name            {person.last.kanji}
    family_name_kana      {person.first.katakana}
    first_name_kana       {person.last.katakana}
    birthday              {Faker::Date.birthday}
  end
end