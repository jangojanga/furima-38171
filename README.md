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
| category      |  string   | null: false |
| item status   | ActiveHash| null: false |
| lord          | ActiveHash| null: false |
| former area   | ActiveHash| null: false |
| days before   | ActiveHash| null: false |
| price         | string| null: false |
|||
### Association

- has_many :items
- has_many :user


## buyer テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :user
- has_one :adrress

## adrress テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| buyer     | references |                                |
| tel       | string     | null: false, foreign_key: true |
|post code  | string     | null: false, foreign_key: true |
|prefectures| string     | null: false, foreign_key: true |
|address   | string     | null: false, foreign_key: true |
|building   | string     | null: false, foreign_key: true |

### Association

- belongs_to :buyer
