class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_time
  belongs_to :user
  has_one_attached :image

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :user_id
    validates :image
    validates :item_name
    validates :item_detail
    validates :category_id
    validates :item_status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :delivery_time_id
    validates :price
  end

  #ジャンルの選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :item_status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :delivery_time_id
  end
end
