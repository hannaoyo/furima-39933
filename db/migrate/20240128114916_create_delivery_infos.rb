class CreateDeliveryInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_infos do |t|
      t.references :order, null: false, foreign_key: true
      t.string     :postal_code,     null: false
      t.integer    :prefecture_id,   null: false
      t.string     :city,            null: false
      t.string     :address_number,  null: false
      t.string     :building_name
      t.string     :phone_number,    null: false
      t.timestamps
    end
  end
end
