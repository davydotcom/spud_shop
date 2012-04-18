class CreateSpudProductPhotos < ActiveRecord::Migration
  def change
    create_table :spud_product_photos do |t|
      t.string :name
      t.text :caption
      t.string :photo_file_name
      t.integer :photo_file_size
      t.string :photo_content_type
      t.integer :spud_product_id
      t.integer :display_order

      t.timestamps
    end
    add_index :spud_product_photos,[:spud_product_id,:display_order]
  end
end
