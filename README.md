# README

# テーブル設計

## users テーブル 

| Column                   | Type   | Options                   | 
| ------------------       | ------ | -----------               | 
| nickname                 | string | null: false               | 
| email                    | string | null: false, unique: true | 
| encrypted_password       | string | null: false               | 
| password_confirmation    | string | null: false               | 
| first_name               | string | null: false               | 
| last_name                | string | null: false               | 
| first_name_kana          | string | null: false               | 
| last_name_kana           | string | null: false               | 
| birthday                 | string | null: false               | 


### Association 
- has_many :items 
- has_many :purchase_records 

## items テーブル 

| Column             | Type       | Options                        | 
| ------------------ | ------     | -----------                    | 
| items_image        | string     | null: false                    | 
| items_name         | string     | null: false, unique: true      | 
| items_details      | text       | null: false                    | 
| items_status       | integer    | null: false                    | 
| delivery_charge    | integer    | null: false                    | 
| ship_from_area     | integer    | null: false                    | 
| delivery_times     | integer    | null: false                    | 
| price              | integer    | null: false                    | 
| user               | references | null: false, foreign_key: true | 


### Association 
- belongs_to :user 
- has_one :purchase_record 

## purchase_records テーブル 

| Column           | Type       | Options                        | 
| ---------------- | ------     | -----------                    | 
| buyer_info       | string     | null: false                    | 
| purchased_item   | string     | null: false                    | 
| user             | references | null: false, foreign_key: true | 
| item             | references | null: false, foreign_key: true | 


### Association 
- belongs_to :user 
- belongs_to :item 
- has_one :delivery_info 

## delivery_info テーブル 

| Column             | Type       | Options                        | 
| ------------------ | ------     | -----------                    | 
| card_number        | string     | null: false                    | 
| expiration_year    | string     | null: false                    | 
| expiration_month   | string     | null: false                    | 
| security_code      | string     | null: false                    | 
| postal_code        | string     | null: false                    | 
| prefecture         | string     | null: false                    | 
| city               | string     | null: false                    | 
| address_number     | string     | null: false                    | 
| building_name      | string     |                                | 
| phone_number       | string     | null: false                    | 
| purchase_record    | references | null: false, foreign_key: true | 


### Association 
- belongs_to :purchase_record 
