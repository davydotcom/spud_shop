class CreateSpudAttributes < ActiveRecord::Migration
  def change
    create_table :spud_attributes do |t|
      t.string :name
      t.integer :display_order,:default => 0
      t.timestamps
    end
  end
end
