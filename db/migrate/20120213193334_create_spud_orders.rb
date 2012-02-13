class CreateSpudOrders < ActiveRecord::Migration
  def change
    create_table :spud_orders do |t|
      t.integer :spud_cart_id
      t.string :ip_address
      t.string :first_name
      t.string :last_name
      t.string :card_type
      t.date :card_expires_at

      t.timestamps
    end
    add_index :spud_orders,:spud_cart_id
  end
end
