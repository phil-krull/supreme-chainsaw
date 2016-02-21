class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  belongs_to :buyer, :foreign_key => "buyer_id", class_name: "User"
end
