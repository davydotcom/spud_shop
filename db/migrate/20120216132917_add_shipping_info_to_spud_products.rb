class AddShippingInfoToSpudProducts < ActiveRecord::Migration
  def change
    add_column :spud_products, :package_weight, :decimal

    add_column :spud_products, :package_width, :decimal

    add_column :spud_products, :package_height, :decimal

    add_column :spud_products, :package_length, :decimal


    add_column :spud_products, :fixed_ship_cost, :decimal

  end
end
