class SearchesController < ApplicationController
   before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "Post"
      @posts = Post.looks(params[:search], params[:word])
    else
      @tags = Tag.looks(params[:search], params[:word])
    end
  end
end
