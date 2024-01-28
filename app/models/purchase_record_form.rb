class PurchaseRecordForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :building_name
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    DeliveryInfo.create(purchase_record_id: purchase_record_id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_number: address_number, building_name: building_name, phone_number: phone_number)
  end
end