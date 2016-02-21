class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :user, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.references :buyer, index: true

      t.timestamps null: false
    end
    add_foreign_key :purchases, :users, column: :buyer_id
    add_index :purchases, [:user_id, :buyer_id], unique: true
  end
end
