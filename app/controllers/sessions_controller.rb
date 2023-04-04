class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email:params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "Logged in sucessfully"
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:alert] = "There was something wrong while login"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out sucessfully'
    redirect_to root_path
  end
end