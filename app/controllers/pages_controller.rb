class PagesController < ApplicationController
  def home
    redirect_to articles_path if logged_in?
  end

  def about
  end

  def get_request
    render :json => {:name => "any name"}
  end
end
