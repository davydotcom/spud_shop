class CreateSpudProductCategories < ActiveRecord::Migration
  def change
    create_table :spud_product_categories do |t|
      t.string :name
      t.text :description
      t.integer :spud_product_category_id
      t.integer :category_order,:default => 0
      t.timestamps
    end
    add_index :spud_product_categories,:spud_product_category_id
  end
end
