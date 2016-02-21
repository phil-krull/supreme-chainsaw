class Product < ActiveRecord::Base
  belongs_to :user
  has_many :purchases
  validates_presence_of :name, :amount, :presence => true
end
