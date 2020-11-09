# README

## usersテーブル
| Column           | Type   | options     | 
| ---------------- | ------ | ----------- | 
| nick name        | string | null: false | 
| email            | string | null: false | 
| password         | string | null: false | 
| first name       | string | null:false  | 
| second name      | string | null: false | 
| first name kana  | string | null: false | 
| second name kana | string | null: false | 
| birthday         | string | null: false | 

### Association
has_many :items
has_many :purchase_records

## itemsテーブル
| Column                     | Type       | Options     | 
| -------------------------- | ---------- | ----------- | 
| item_name                  | string     | null: false | 
| item_explanation           | text       | null:false  | 
| item_category              | string     | null: false | 
| item_status                | string     | null: false | 
| burden of shipping charges | string     | null: false | 
| Shipping area              | string     | null: false | 
| Days to ship               | string     | null: false | 
| Selling price              | string     | null: false | 
| user_id                    | references |             | 
| image                      |            |             | 

### Association
belongs_to :user
has_one    :purchase_record

## purchase_recordテーブル
| Column        | Type       | Options           | 
| ------------- | ---------- | ----------------- | 
| user_id       | references | foreign_key: true | 
| item_id       | references | foreign_key: true | 
| date_and_time | string     | null: false       | 
### Association
belongs_to :user
belongs_to ;item
belongs_to :street_address

## street_addressテーブル
| Column                    | Type   | Options     | 
| ------------------------- | ------ | ----------- | 
| postal_code               | string | null: false | 
| prefectures               | string | null: false | 
| cities_towns_and_villages | string | null: false | 
| street_number             | string | null: false | 
| building_name             | string | null: false | 
| telephone_number          | string | null: false | 
### Association
belongs_to :purchase_record