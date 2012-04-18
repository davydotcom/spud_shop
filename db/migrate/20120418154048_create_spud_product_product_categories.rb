class CreateSpudProductProductCategories < ActiveRecord::Migration
  def change
    create_table :spud_product_product_categories do |t|
      t.integer :spud_product_id
      t.integer :spud_product_categoriy_id

      t.timestamps
    end
    add_index :spud_product_product_categories,:spud_product_category_id
    add_index :spud_product_product_categories,:spud_product_id
  end
end
