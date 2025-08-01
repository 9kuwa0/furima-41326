class Item < ApplicationRecord

  belongs_to :user
  has_one :record
  has_one_attached :image
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :image,             presence: true
  validates :item_name,         presence: true
  validates :item_description,  presence: true
  validates :item_category_id,  presence: true, numericality: {other_than: 1, message: "can't be blank"}
  validates :item_condition_id, presence: true, numericality: {other_than: 1, message: "can't be blank"}
  validates :shipping_fee_id,   presence: true, numericality: {other_than: 1, message: "can't be blank"}
  validates :prefecture_id,     presence: true, numericality: {other_than: 1, message: "can't be blank"}
  validates :shipping_day_id,   presence: true, numericality: {other_than: 1, message: "can't be blank"}
  validates :item_price,        presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

end
