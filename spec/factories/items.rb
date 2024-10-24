FactoryBot.define do
  factory :test_item, class: 'Item' do
    item_name          { Faker::Commerce.product_name }
    item_description   { Faker::Lorem.paragraph }
    item_category_id   { Faker::Number.between(from: 2, to: 11)}
    item_condition_id  { Faker::Number.between(from: 2, to: 7)}
    shipping_fee_id    { Faker::Number.between(from: 2, to: 3)}
    prefecture_id      { Faker::Number.between(from: 2, to: 48)}
    shipping_day_id    { Faker::Number.between(from: 2, to: 4)}
    item_price         { Faker::Number.between(from: 300, to: 9999999)}
    association :user
  
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
