# テーブル設計

## usersテーブル

| Column             | Type      | Options                     |
|--------------------|-----------|-----------------------------|
| nickname           | string    | null: false                 |
| email              | string    | null: false, unique : true  |
| encrypted_password | string    | null: false                 |
| last_name_kanji    | string    | null: false                 |
| first_name_kanji   | string    | null: false                 |
| last_name_kana     | string    | null: false                 |
| first_name_kana    | string    | null: false                 |
| birth_year         | text      | null: false                 |
| birth_month        | text      | null: false                 |
| birth_day          | text      | null: false                 |

### association

-has_many :items
-has_many :records

## itemsテーブル

| Column           | Type      | Options                             |
|------------------|-----------|-------------------------------------|
| item_name        | string    | not null                            |
| item_description | text      | not null                            |
| item_category    | string    | not null                            |
| item_condition   | string    | not null                            |
| item_delivery    | string    | not null                            |
| item_source      | string    | not null                            |
| item_num_day     | string    | not null                            |
| item_price       | integer   | not null, 300~9,999,999             |
| item_fee         | integer   | not null, item_price * 0.1 floor    |
| item_profit      | integer   | not null, item_profit - item_fee    |
| user_id          | reference | not null, foreign_key: true         |

### association

-belongs_to :user
-has_one :record
-has_one_attached :image

## recordsテーブル

| Column         | Type         | Options                        |
|----------------|--------------|--------------------------------|
| item_name_id   | reference    | not null, foreign_key: true    |
| item_price_id  | reference    | not null, foreign_key: true    |
| user_id        | reference    | not null, foreign_key: true    |
| address_id     | reference    | not null, foreign_key: true    |
| sold_day       | date         | not null                       |

### association

-belongs_to :user
-belongs_to :record
-has_one :address

## addressesテーブル

| Column         | Type         | Options                        |
|----------------|--------------|--------------------------------|
| post_code      | string       | not null                       |
| prefecture     | string       | not null                       |
| municipalily   | string       | not null                       |
| block          | string       | not null                       |
| bilding        | string       |                                |
| phone_num      | integer      | not null                       |

### association

-belongs_to :record