## users テーブル 

| Column                   | Type   | Options                   | 
| ------------------       | ------ | -----------               | 
| nickname                 | string | null: false               | 
| email                    | string | null: false, unique: true | 
| encrypted_password       | string | null: false               | 
| first_name               | string | null: false               | 
| last_name                | string | null: false               | 
| first_name_kana          | string | null: false               | 
| last_name_kana           | string | null: false               | 
| birthday                 | date   | null: false               | 


### Association 
- has_many :items 
- has_many :orders 

## items テーブル 

| Column             | Type       | Options                        | 
| ------------------ | ------     | -----------                    | 
| item_name          | string     | null: false                    | 
| item_detail        | text       | null: false                    | 
| category_id        | integer    | null: false                    | 
| item_status_id     | integer    | null: false                    | 
| delivery_charge_id | integer    | null: false                    | 
| prefecture_id      | integer    | null: false                    | 
| delivery_time_id   | integer    | null: false                    | 
| price              | integer    | null: false                    | 
| user               | references | null: false, foreign_key: true | 


### Association 
- belongs_to :user 
- has_one :order 

## orders テーブル 

| Column           | Type       | Options                        | 
| ---------------- | ------     | -----------                    | 
| user             | references | null: false, foreign_key: true | 
| item             | references | null: false, foreign_key: true | 


### Association 
- belongs_to :user 
- belongs_to :item 
- has_one :delivery_info 

## delivery_infos テーブル 

| Column             | Type       | Options                        | 
| ------------------ | ------     | -----------                    | 
| postal_code        | string     | null: false                    | 
| prefecture_id      | integer    | null: false                    | 
| city               | string     | null: false                    | 
| address_number     | string     | null: false                    | 
| building_name      | string     |                                | 
| phone_number       | string     | null: false                    | 
| order              | references | null: false, foreign_key: true | 


### Association 
- belongs_to :order 