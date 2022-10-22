# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, add_index :users, [:email], unique: true |
| encrypted_password | string | null: false |
| Identification     | string | null: false |
| date of birth      | string | null: false |

### Association

- has_many : items
- has_many : purchase records
- has_one  : shippings