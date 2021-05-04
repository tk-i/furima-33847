## usersテーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| name      | string | null: false |
| name_kana | string | null: false |
| birthday  | string | null: false |

## Association
- has_many :items
- has_one :buyer
- has_many :comments

## itemsテーブル

| Column   | Type       | Options           |
| -------  | ---------- | ----------------- |
| title    | string     | null: false       |
| text     | text       | null: false       |
| price    | string     | null: false       |
| status   | string     | null: false       |
| burden   | string     | null: false       |
| area     | string     | null: false       |
| shipment | string     | null: false       |
| user     | references | foreign_key: true |

## Association
- belongs_to :user
- has_one :buyer
- has_many :categories, through: item_categories
- has_many :comments

## categoriesテーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| categorize | text       | null: false       |
| user       | references | foreign_key: true |
| item       | references | foreign_key: true |

## Association
- has_many :items, through: item_categories

## item_categoriesテーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| user       | references | foreign_key: true |
| categorize | references | foreign_key: true |

## Association
- belongs_to :item
- belongs_to :categories

## buyersテーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| credit     | string     | null: false       |
| expiration | string     | null: false       |
| security   | string     | null: false       |
| postal     | string     | null: false       |
| region     | string     | null: false       |
| city       | string     | null: false       |
| address    | string     | null: false       |
| address2   | string     |                   |
| phone      | string     | null: false       |
| user       | references | foreign_key: true |
| item       | references | foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item

## commentsテーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| text   | text       | null: false       |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item