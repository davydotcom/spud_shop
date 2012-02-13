class CreateSpudCartItems < ActiveRecord::Migration
  def change
    create_table :spud_cart_items do |t|
      t.integer :spud_cart_id
      t.string :description
      t.integer :quantity
      t.decimal :unit_price
      t.decimal :full_price
      t.integer :spud_product_id

      t.timestamps
    end
    add_index :spud_cart_items, :cart_id
  end
end
