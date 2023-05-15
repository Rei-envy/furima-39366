# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| name               | string  | null: false               |
| kana_name          | string  | null: false               |
| birthday           | date    | null: false               |


### Association

- has_many : items
- has_many : purchases


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| introduce    | text       | null: false,                   |
| category_id  | integer    | null: false,                   |
| statement_id | integer    | null: false,                   |
| load_id      | integer    | null: false,                   |
| region_id    | integer    | null: false,                   |
| send_day_id  | integer    | null: false,                   |
| price        | integer    | null: false,                   |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- has_one : purchase

<!-- - belongs_to :モデル名  ActiveHash用 -->



## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |


### Association

- belongs_to : user
- belongs_to : item
- has_one  : address




## addresses テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| locality      | string     | null: false                    |
| house_number  | string     | null: false                    |
| building      | string     |                                |
| phone         | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |


### Association

- belongs_to : purchase

<!-- - belongs_to : モデル名 ActiveHash用 -->