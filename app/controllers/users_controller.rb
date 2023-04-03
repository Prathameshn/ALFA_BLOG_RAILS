class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
    # or by passing variable obj whle rendering
  end

  def index
    @users = User.all
  end

  def new
    @user= User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
     # debugger
     @user = User.find(params[:id])
     if @user.update(user_params)
       flash[:notice] = "#{@user.username} Updated Successfully"
       redirect_to  articles_path
     else
       render 'edit'
     end
  end

  def create
    # debugger
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Alpha Blog, #{@user.username} you have successfully singed up"
      redirect_to  articles_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,:email,:password)
  end

  def set_user

  end
end