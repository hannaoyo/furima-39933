class RenamePurchaseRecordIdToOrderIdInDeliveryInfos < ActiveRecord::Migration[7.0]
  def change
    rename_column :delivery_infos, :purchase_record_id, :order_id
  end
end
