class CreateSpudProductAttributes < ActiveRecord::Migration
  def change
    create_table :spud_product_attributes do |t|
      t.integer :spud_attribute_id
      t.integer :spud_product_id
      t.text :value

      t.timestamps
    end
    add_index :spud_product_attribtues,:spud_attribute_id
    add_index :spud_product_attribtues,:spud_product_id
  end
end
