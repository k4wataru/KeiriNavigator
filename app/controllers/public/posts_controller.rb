class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
    # @post_comment = PostComment.new
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
    redirect_to posts_path
  end

  def search
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :content,:genre_id)
  end
end
