class SessionsController < ApplicationController

  def login
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user] = user.first_name
      redirect_to products_index_path
    else
      flash[:errors] = ['Incorrect email or password']
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil
    session[:user] = nil

    redirect_to root_path
  end

end
