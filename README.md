# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :syouhin
- has_many :syuppinnsya
- has_many :kattahito
- has_many :syouhin

## syouhin テーブル

| Column        | Type      | Options     |
| ------        | ------    | ----------- |
| kstegori      | string    | null: false |
| burando       | string    | null: false |
| syasin        | string    | null: false |
| syouhinname   | string    | null: false |
| syouhinsetumei| string    | null: false |
| user          | references| null: false |
| syuppinsya    | references| null: false |
| kattahito     | references| null: false |
|||
### Association

- has_many :kattahito
- has_many :syuppinsya
- belongs_to :user





## kattahito テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| syouhin| references | null: false, foreign_key: true |

### Association

- belongs_to :syouhin
- belongs_to :user

## syuppinsya テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| syouhin | references | null: false, foreign_key: true |

### Association

- belongs_to :syouhin
- belongs_to :user
