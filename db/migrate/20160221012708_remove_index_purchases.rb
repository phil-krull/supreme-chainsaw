class RemoveIndexPurchases < ActiveRecord::Migration
  def change
    remove_index :purchases, [:user_id, :buyer_id]
  end
end
