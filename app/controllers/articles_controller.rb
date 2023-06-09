class ArticlesController < ApplicationController
  before_action :set_article,only:[:show, :edit, :destroy, :update]
  before_action :required_user,except: [:show,:index]
  before_action :required_same_user,only:[:edit, :destroy, :update]


  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 1)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save  
      # render plain: @article
      #or
      # redirect_to article_path(@article)
      #or
      flash[:notice] = "Article created successfully"
      redirect_to @article
    else
      flash[:alert] = "Article create failed"
      render '/articles/new'
    end
  end


  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article edited Successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private 

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title,:description)
  end

  def required_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @article
    end
  end
end 