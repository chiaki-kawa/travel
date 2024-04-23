class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:post][:tag_ids].split(',')
    if @post.save
      @post.save_tags(tag_list)
      redirect_to posts_path, notice:'投稿が完了しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def index
    @post = Post.all
    @tag_list = PostTag.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    tag_list = params[:post][:tag_id].split(',')
    if @post.update(post_params)
      @post.savetags(tag_list)
      redirect_to post_path(post.id)
    else
      render :edit
    end
  end

  def search_tag
    @tag_list = PostTag.all
    @tag = PostTag.find(params[:post_tag_id])
    @posts = @tag.posts
  end

  def tags
    @tag_list = Tag.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :body)
  end
end
