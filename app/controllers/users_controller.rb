class UsersController < ApplicationController

  def index
  end

  def create
    user = User.new ( create_params )
    if user.valid?
      user.save
      flash[:errors] = ['Thank you for registering, please log in to continue']
      redirect_to users_index_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to users_index_path
    end
  end

  def show
    @products = Product.all
    @purchases = Purchase.all
  end

  private

  def create_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
