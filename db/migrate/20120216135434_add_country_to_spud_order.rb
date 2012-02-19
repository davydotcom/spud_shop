class AddCountryToSpudOrder < ActiveRecord::Migration
  def change
    add_column :spud_orders, :shipping_country, :string

    add_column :spud_orders, :bill_country, :string

  end
end
