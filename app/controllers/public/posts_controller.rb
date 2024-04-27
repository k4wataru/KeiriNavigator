class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(selected: :desc)
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), notice: "You have created post successfully."
    else
      @posts = Post.all
      flash.now[:alert] = "Failed to create post."
      render 'new'
    end
  end

def edit
  @post = Post.find(params[:id])
end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "You have updated post successfully."
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end
  
  def select_comment
    @post = Post.find(params[:post_id])
    @post.update(selected_comment_id: params[:comment_id])
    redirect_to post_path(@post)
  end

  def unselect_comment
    @post = Post.find(params[:post_id])
    @post.update(selected_comment_id: nil)
    redirect_to post_path(@post)
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :content,:genre_id)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to root_path
    end
  end
end
