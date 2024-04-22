class Admin::PostsController < ApplicationController
  before_action :authenticate_admin! #管理者以外に触らせたくないページに記述
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_root_path, notice: '投稿を削除しました'
  end
end