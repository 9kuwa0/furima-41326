# テーブル設計

## usersテーブル

| Column             | Type      | Options                     |
|--------------------|-----------|-----------------------------|
| nickname           | string    | null: false                 |
| email              | string    | null: false, unique: true   |
| encrypted_password | string    | null: false                 |
| last_name_kanji    | string    | null: false                 |
| first_name_kanji   | string    | null: false                 |
| last_name_kana     | string    | null: false                 |
| first_name_kana    | string    | null: false                 |
| birthday           | date      | null: false                 |

### association

-has_many :items
-has_many :records

## itemsテーブル

| Column            | Type       | Options                             |
|-------------------|------------|-------------------------------------|
| item_name         | string     | null: false                         |
| item_description  | text       | null: false                         |
| item_category_id  | integer    | null: false                         |
| item_condition_id | integer    | null: false                         |
| shipping_fee_id   | integer    | null: false                         |
| prefecture_id     | integer    | null: false                         |
| shipping_day_id   | integer    | null: false                         |
| item_price        | integer    | null: false                         |
| user              | references | null: false, foreign_key: true      |

### association

-belongs_to :user
-has_one :record
-has_one_attached :image

## recordsテーブル

| Column         | Type          | Options                         |
|----------------|---------------|---------------------------------|
| item_name      | references    | null: false, foreign_key: true  |
| user           | references    | null: false, foreign_key: true  |

### association

-belongs_to :user
-belongs_to :item
-has_one :address

## addressesテーブル

| Column         | Type         | Options                           |
|----------------|--------------|-----------------------------------|
| post_code      | string       | null: false                       |
| prefecture_id  | integer      | null: false                       |
| municipalily   | string       | null: false                       |
| block          | string       | null: false                       |
| building       | string       |                                   |
| phone_num      | integer      | null: false                       |
| record         | references   | null: false, foreign_key: true    |

### association

-belongs_to :record