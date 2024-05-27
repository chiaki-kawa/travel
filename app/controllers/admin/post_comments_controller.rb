class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
      @post_comment = PostComment.find(params[:id])
      @post_comment.destroy
      redirect_to admin_dashboards_path, notice: 'コメントを削除しました。'
  end
end
