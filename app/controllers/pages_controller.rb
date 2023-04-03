class PagesController < ApplicationController
  def home
  end

  def about
  end

  def get_request
    render :json => {:name => "any name"}
  end
end
