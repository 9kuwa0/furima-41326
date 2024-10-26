FactoryBot.define do
  factory :record_address do
    token          { "tok_abcdefghijk00000000000000000" }
    post_code      { "123-4567" }
    prefecture_id  { Faker::Number.between(from: 2, to: 48)}
    municipality   { "岐阜市" }
    block          { "金華山天守閣18" }
    building       { "岐阜城" }
    phone_num      { "0120999999" }

    association :user
    association :item
  end
end