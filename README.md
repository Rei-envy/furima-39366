# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| name               | string  | null: false               |
| birthday           | integer | null: false               |


### Association

- has_many : items
- has_many : purchases


## items テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| introduce | text       | null: false,                   |
| delivery  | string     | null: false,                   |
| price     | integer    | null: false,                   |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- has_one : purchase



## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |


### Association

- belongs_to : user
- belongs_to : item
- has_one  : address




## addresses テーブル

| Column        | Type    | Options      |
| ------------  | ------- | ------------ |
| post_code     | integer | null: false  |
| state         | string  | null: false  |
| locality      | string  | null: false  |
| house_number  | string  | null: false  |
| building      | string  | null: false  |
| phone         | integer | null: false  |

### Association

- belongs_to : purchase