# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false ,unique: ture|
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| first_name_huri    | string | null: false |
| family_name        | string | null: false |
| family_name_huri   | string | null: false |
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
| item_status_id   | integer| null: false |
| lord_id          | integer| null: false |
| former_area_id   | integer| null: false |
| days_before_id   | integer| null: false |
| price            | integer| null: false |
|||
### Association

- has_one :buyer
- belongs_to :user


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
|post_code  | string     | string | null: false |
|former_area_id| references | null: false, foreign_key: true |
|city       | string     | string | null: false |
|address   | string      | string | null: false |
|building   | string     |
| tel       | string     | string | null: false |
| buyer     | references | null: false, foreign_key: true |
### Association

- belongs_to :buyer
