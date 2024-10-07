class Item < ApplicationRecord

  belongs_to :user
  has_one :record
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :item_name,         presence: true
  validates :item_description,  presence: true
  validates :item_category_id,  presence: true
  validates :item_condition_id, presence: true
  validates :shipping_fee_id,   presence: true
  validates :prefecture_id,     presence: true
  validates :shipping_day_id,   presence: true
  validates :item_price,        presence: true
  
  validates :item_category_id, numericality: {other_than: 1}
  validates :item_condition_id, numericality: {other_than: 1}
  validates :shipping_fee_id, numericality: {other_than: 1}
  validates :prefecture_id, numericality: {other_than: 1}
  validates :shipping_day_id, numericality: {other_than: 1}
  validates :item_price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

end