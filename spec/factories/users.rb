FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.email }
    password              { "a1 #{Faker::Internet.password(min_length: 6)}" }
    password_confirmation { password }
    last_name_kanji       { '山田' }
    first_name_kanji      { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { Faker::Date.birthday }
  end
end
