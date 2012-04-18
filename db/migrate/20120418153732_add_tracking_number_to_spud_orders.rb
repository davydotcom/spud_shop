class AddTrackingNumberToSpudOrders < ActiveRecord::Migration
  def change
    add_column :spud_orders, :tracking_number, :string
    add_column :spud_orders, :status, :string,:default => "processing"
  end
  add_index :spud_orders,:status
end
