class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      ## Database authenticatable
      t.string     :item_name,          null: false, default: ""
      t.text       :item_detail,        null: false
      t.integer    :category_id,        null: false
      t.integer    :item_status_id,     null: false
      t.integer    :delivery_charge_id, null: false
      t.integer    :prefecture_id,      null: false
      t.integer    :delivery_time_id,   null: false
      t.integer    :price,              null: false
      t.references :user,               null: false, foreign_key: true


      t.timestamps
    end
  end
end
