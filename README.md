# README

## usersテーブル
| Column           | Type   | options     | 
| ---------------- | ------ | ----------- | 
| nick_name        | string | null: false | 
| email            | string | null: false | 
|encrypted_password| string | null: false | 
| first_name       | string | null:false  | 
| second_name      | string | null: false | 
| first_name_kana  | string | null: false | 
| second_name_kana | string | null: false | 
| birthday         | date   | null: false | 

### Association
has_many :items
has_many :purchase_records

## itemsテーブル
| Column                        | Type       | Options     | 
| --------------------------    | ---------- | ----------- | 
|      name                     | string     | null: false | 
|      explanation              | text       | null:false  | 
|      category_id              | integer    | null: false | 
|      status_id                | integer    | null: false | 
| burden_of_shipping_charges_id | integer    | null: false | 
| shipping_area_id              | integer    | null: false | 
| days_to_ship_id               | integer    | null: false | 
| selling_price                 | integer    | null: false | 
| user                          | references | foreign_key: true | 


### Association
belongs_to :user
has_one    :purchase_record

## purchase_recordsテーブル
| Column        | Type       | Options           | 
| ------------- | ---------- | ----------------- | 
| user          | references | foreign_key: true | 
| item          | references | foreign_key: true | 
 
### Association
belongs_to :user
belongs_to ;item
has_one    :street_address

## street_addressテーブル
| Column                    | Type   | Options     | 
| ------------------------- | ------ | ----------- | 
| postal_code               | string | null: false | 
| prefectures_id            | integer | null: false | 
| cities_towns_and_villages | string | null: false | 
| street_number             | string | null: false | 
| building_name             | string |             | 
| telephone_number          | string | null: false | 
### Association
belongs_to :purchase_record