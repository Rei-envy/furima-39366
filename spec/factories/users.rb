FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }

    japanese_user = Gimei.name
    last_name             { japanese_user.last.kanji }
    first_name            { japanese_user.first.kanji }
    kana_last_name        { japanese_user.last.katakana }
    kana_first_name       { japanese_user.first.katakana }
    birthday              { Faker::Date.backward }
  end
end
