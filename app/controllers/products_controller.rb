class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def create
    @user = User.find(session[:user_id])
    product = Product.new ( create_params )
    if product.valid?
      product.user = @user
      product.sold = false
      product.save
      flash[:errors] = ['Thank you for adding a product']
      index
      redirect_to "/users/#{session[:user_id]}"
    else
      flash[:errors] = product.errors.full_messages
      redirect_to "/users/#{session[:user_id]}"
    end
  end

  def destroy
    product = Product.find(params[:product]).destroy
    flash[:errors] = ["You just deleted #{product.name}"]
    redirect_to "/users/#{session[:user_id]}"
  end

    private

  def create_params
    params.require(:product).permit(:name, :amount)
  end

end
