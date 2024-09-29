# テーブル設計

## usersテーブル

| Column             | Type      | Options                     |
|--------------------|-----------|-----------------------------|
| nickname           | string    | null: false                 |
| email              | string    | null: false, unique:  true  |
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
| item_name         | string     | not null                            |
| item_description  | text       | not null                            |
| item_category_id  | integer    | not null                            |
| item_condition_id | integer    | not null                            |
| shipping_fee_id   | integer    | not null                            |
| prefecture_id     | integer    | not null                            |
| shipping_day_id   | integer    | not null                            |
| item_price        | integer    | not null                            |
| user              | references | not null, foreign_key: true         |

### association

-belongs_to :user
-has_one :record
-has_one_attached :image

## recordsテーブル

| Column         | Type          | Options                        |
|----------------|---------------|--------------------------------|
| item_name      | references    | not null, foreign_key: true    |
| item_price     | references    | not null, foreign_key: true    |
| user           | references    | not null, foreign_key: true    |
| address        | references    | not null, foreign_key: true    |

### association

-belongs_to :user
-belongs_to :item
-has_one :address

## addressesテーブル

| Column         | Type         | Options                        |
|----------------|--------------|--------------------------------|
| post_code      | string       | not null                       |
| prefecture_id  | integer      | not null                       |
| municipalily   | string       | not null                       |
| block          | string       | not null                       |
| building       | string       |                                |
| phone_num      | integer      | not null                       |
| record         | references   | not null, foreign_key: true    |

### association

-belongs_to :record