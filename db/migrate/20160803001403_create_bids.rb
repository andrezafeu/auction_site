class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.float :value
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
