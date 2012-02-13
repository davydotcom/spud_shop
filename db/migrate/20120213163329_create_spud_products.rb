class CreateSpudProducts < ActiveRecord::Migration
  def change
    create_table :spud_products do |t|
      t.string :item_number
      t.string :name
      t.text :description
      t.boolean :active
      t.decimal :base_price
      t.timestamps
    end
    add_index :spud_products,:item_number
    add_index :spud_products,:active
    add_index :spud_products,:name
  end
end
