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
| date of birth      | string | null: false |
  


### Association

- has_many :item
- has_many :buyer

## item テーブル

| Column        | Type      | Options     |
| ------        | ------    | ----------- 
| name          | string    | null: false |
| description   | text      | null: false |
| category      | ActiveHash| null: false |
| item status   | ActiveHash| null: false |
| lord          | ActiveHash| null: false |
| former area   | ActiveHash| null: false |
| days before   | ActiveHash| null: false |
| price         | references| null: false |
|||
### Association

- has_many :item
- belongs_to :user


## buyer テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- has_many :item
- belongs_to :user
- has_one :adrress

## adrress テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| content   | string     |                                |
| tel       | string     | null: false, foreign_key: true |
|post code  | string     | null: false, foreign_key: true |
|prefectures| string     | null: false, foreign_key: true |
|adorress   | string     | null: false, foreign_key: true |
|building   | string     | null: false, foreign_key: true |

### Association

- belongs_to :syouhin
- belongs_to :user
- belongs_to :buyer
