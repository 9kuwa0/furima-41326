class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :records

  validates :nickname,         presence: true
  validates :last_name_kanji,  presence: true
  validates :first_name_kanji, presence: true
  validates :last_name_kana,   presence: true
  validates :first_name_kana,  presence: true
  validates :birthday,         presence: true
end