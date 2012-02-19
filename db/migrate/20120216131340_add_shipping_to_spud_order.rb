class AddShippingToSpudOrder < ActiveRecord::Migration
  def change
    add_column :spud_orders, :ship_same_as_billing, :boolean

    add_column :spud_orders, :shipping_address1, :string

    add_column :spud_orders, :shipping_address2, :string

    add_column :spud_orders, :shipping_city, :string

    add_column :spud_orders, :shipping_state, :string

    add_column :spud_orders, :shipping_zip, :string

    add_column :spud_orders, :shipping_phone, :string

    add_column :spud_orders, :shipping_notes, :text

    add_column :spud_orders, :subtotal_price,:decimal, :default => 0.0
    add_column :spud_orders, :tax_price,:decimal, :default => 0.0
    add_column :spud_orders, :shipping_price,:decimal, :default => 0.0
    add_column :spud_orders, :total_price,:decimal, :default => 0.0
  end
end
