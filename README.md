## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

## Association
- has_many :items
- has_many :logs
- has_many :comments

## itemsテーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| title       | string     | null: false       |
| text        | text       | null: false       |
| category_id | integer    | null: false       |
| price       | integer    | null: false       |
| status_id   | integer    | null: false       |
| burden_id   | integer    | null: false       |
| area_id     | integer    | null: false       |
| shipment_id | integer    | null: false       |
| user        | references | foreign_key: true |

## Association
- belongs_to :user
- has_one :log
- has_many :comments

## buyersテーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| postal     | string     | null: false       |
| area_id    | integer    | null: false       |
| city       | string     | null: false       |
| address    | string     | null: false       |
| address2   | string     |                   |
| phone      | string     | null: false       |
| log        | references | foreign_key: true |

## Association
- belongs_to :log

## logsテーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| user       | references | foreign_key: true |
| item       | references | foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- has_one :buyer

## commentsテーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| text   | text       | null: false       |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item