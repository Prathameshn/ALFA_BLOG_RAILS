class UsersController < ApplicationController

  before_action :set_user, only:[:show, :edit, :update ]
  before_action :required_user, only:[:edit, :update ]
  before_action :required_same_user, only:[:edit, :update ]


  def show
    @articles = @user.articles
    # or by passing variable obj whle rendering
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def new
    @user= User.new
  end

  def edit
  end

  def update
     # debugger
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
      session[:user_id] = @user.id
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
    @user = User.find(params[:id])
  end

  def required_same_user
    if @user != current_user
      flash[:alert] = "You can only edit your own account"
      redirect_to @user
    end
  end
end