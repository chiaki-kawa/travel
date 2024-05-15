class SearchesController < ApplicationController
   before_action :authenticate_user!

  def search
    @range = params[:range]
    @posts = Post.includes(:post_tags)
    
    if @range == "Post"
      @posts = @posts.looks(params[:search], params[:word])
    else
      @tags = Tag.looks(params[:search], params[:word])
      @posts = @posts.where("post_tags.tag_id": @tags.ids)
    end
    render :search_result
  end
end
