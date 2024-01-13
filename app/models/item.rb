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
  validates :item_name, :item_detail, :price, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :item_status_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_time_id, numericality: { other_than: 1, message: "can't be blank" } 
end
