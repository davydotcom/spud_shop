class AddBillAddressToSpudOrder < ActiveRecord::Migration
  def change
    add_column :spud_orders, :bill_address1, :string

    add_column :spud_orders, :bill_address2, :string

    add_column :spud_orders, :bill_city, :string

    add_column :spud_orders, :bill_state, :string

    add_column :spud_orders, :bill_zip, :string

  end
end
