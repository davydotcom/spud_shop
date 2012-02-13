class CreateSpudCarts < ActiveRecord::Migration
  def change
    create_table :spud_carts do |t|
      t.binary :session_id
      t.timestamps
    end
  end
end
