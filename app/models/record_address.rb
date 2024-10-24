class RecordAddress
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :municipality, :block, :building, :phone_num, :item_price, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :post_code,     format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :block
    validates :phone_num,     format: { with: /\A\d{10,11}\z/}
    validates :item_price
    validates :user_id
  end

  def save
    record = Record.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, block: block, building: building, phone_num: phone_num, record_id: record.id)
  end
end