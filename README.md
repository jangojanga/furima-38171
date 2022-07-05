# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first name         | string | null: false |
| first name huri    | string | null: false |
| family name        | string | null: false |
| family name huri   | string | null: false |
| birthday           | date   | null: false |
  


### Association

- has_many :items
- has_many :buyers

## item テーブル

| Column        | Type      | Options     |
| ------        | ------    | ----------- 
| name          | string    | null: false |
| description   | text      | null: false |
| category_id      | integer| null: false |
| item status_id   | integer| null: false |
| lord_id          | integer| null: false |
| former area_id   | integer| null: false |
| days before_id   | integer| null: false |
| price            | string| null: false |
|||
### Association

- has_one :buyer
- has_many :user


## buyer テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :adrress

## adrress テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
|post code  | string     | null: false, foreign_key: true |
|prefectures| string     | string | null: false |
|city       | string     | string | null: false |
|address   | string      | string | null: false |
|building   | string     | string | null: false |
| tel       | string     | null: false, foreign_key: true |
| buyer     | references | null: false, foreign_key: true |
### Association

- belongs_to :buyer
