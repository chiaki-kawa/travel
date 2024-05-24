class HomeController < ApplicationController
  before_action :logged_in_check
  
  def top
  end
  
  private
  
  def logged_in_check
    redirect_to posts_path if signed_in?
  end
end
