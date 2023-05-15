# テーブル設計

## users テーブル

| Column             | Type   | Options             |
| ------------------ | ------ | ------------------- |
| name               | string | null: false         |
| email              | string | null: false, unique |
| encrypted_password | string | null: false         |

### Association

- has_many : items
- has_many : purchases
- has_one : address


## items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |
| price  | string     | null: false,                   |
| image  | text       | null: false,                   |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : purchase



## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- has_many : items
- has_one  : address




## addresses テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| address | text       | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : purchase