# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name(フリガナ) | string | null: false |
| last_name(フリガナ)  | string | null: false |
| date               | string | null: false |

### Association

- has_many :items
- has_many :purchase_records
- has_one  :shipping

## items テーブル

| Column          | Type        | Options                                           |
| ----------      | ----------  | ------------------------------------------------- |
| lists_id        | integer     | null: false                                       |
| explanation_id  | integer     | null: false                                       |
| detail_id       | integer     | null: false                                       |
| situation_id    | integer     | null: false                                       |
| category_id     | integer     | null: false                                       |
| shipping_charge | string     | null: false |
| region_of_origin| string     | null: false |
| days_to_ship    | string     | null: false |
| selling_price   | string     | null: false |
| user            | references| null: false, foreign_key: true                    |

### Association

- belongs_to :user
- has_one :purchase_record
- belongs_to :shipping


## purchase records テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- has_one :shipping


## shippings テーブル

| Column          | Type       | Options                        |
| ------------    | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| post_code       | string     | null: false |
| prefecture      | string     | null: false |
| municipalities  | string     | null: false |
| address         | string     | null: false |
| building        | string     | null: false |
| phone_number    | string     | null: false |


### Association

- belongs_to :purchase_record