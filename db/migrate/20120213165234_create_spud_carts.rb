class CreateSpudCarts < ActiveRecord::Migration
  def change
    create_table :spud_carts do |t|
      t.string :session_id
      t.boolean :paid

      t.timestamps
    end
  end
end
