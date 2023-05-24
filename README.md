# テーブル設計

## users テーブル

| Column             | Type   | Options   --------------- |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |


### Association

- has_many :orders
- has_many :products

## products テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| explain       | text       | null: false                    |
| price         | integer    | null: false                    |
| category      | integer    | null: false                    |
| status        | integer    | null: false                    |
| shipping_cost | integer    | null: false                    |
| region        | integer    | null: false                    |
| days          | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| product    | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user
- has_one :buyer


## buyers テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | integer    | null: false                    |
| city         | string     | null: false                    |
| block        | string     | null: false                    |
| building     | string     |                                |
| phone        | string     | null: false                    |
| region       | integer    | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association

- belongs_to :order

