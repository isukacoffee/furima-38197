# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| birthday           | date | null: false |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column          | Type        | Options                                           |
| ----------      | ----------  | ------------------------------------------------- |
| lists_id        | integer     | null: false                                       |
| explanation_id  | integer     | null: false                                       |
| detail_id       | integer     | null: false                                       |
| situation_id    | integer     | null: false                                       |
| category_id     | integer     | null: false                                       |
| user            | references | null: false, foreign_key: true |
|shipping_charge  | string     | null: false |
|region of origin | string     | null: false |
|days_to_ship     | string     | null: false |
|selling_price    | string     | null: false |

### Association

- belongs_to :user
- has_one :purchase_record


## purchase_records テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping


## shippings テーブル

| Column          | Type       | Options                        |
| ------------    | ---------- | ------------------------------ |
| item            | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |
| post_code       | string     | null: false |
| prefecture_id   | integer    | null: false |
| municipalitie   | string     | null: false |
| address         | string     | null: false |
| building        | string     
| phone_number    | string     | null: false |


### Association

- belongs_to :purchase_record