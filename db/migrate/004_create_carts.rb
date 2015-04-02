class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :buyer_id, :store_id
    end
  end
end
