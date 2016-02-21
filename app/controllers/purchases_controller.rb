class PurchasesController < ApplicationController

  def create
    buyer = User.find(session[:user_id])
    seller = User.find(params[:seller])
    product = Product.find(params[:product])
    product.sold = true
    product.save
    @purchase = Purchase.create(user:seller, product:product, buyer:buyer)
    redirect_to "/users/#{session[:user_id]}"
  end
end
