class CreateSpudProductPrices < ActiveRecord::Migration
  def change
    create_table :spud_product_prices do |t|
      t.integer :spud_product_id
      t.integer :price_code #0 = Fixed, 1 = Min Quantity, 2 = Fixed Quantity, 3 = Promo
      t.integer :value_type #1 = fixed price, 2 = amount off base, 3 = percentage of base
      t.decimal :value
      t.string :promo_code
      t.date :start_at
      t.date :end_at
      t.timestamps
    end

    add_index :spud_product_prices,:spud_product_id
  end
end
