class AddShippingMethodToSpudOrder < ActiveRecord::Migration
  def change
    add_column :spud_orders, :shipping_method, :string

  end
end
