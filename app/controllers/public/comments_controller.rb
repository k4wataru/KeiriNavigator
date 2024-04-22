class Public::CommentsController < ApplicationController
  
  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    if comment.save
      redirect_to post_path(post), notice: "Comment was successfully created."
    else
      redirect_to post_path(post), alert: "Failed to create comment."
    end
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to post_path(comment.post), notice: "Comment was successfully deleted."
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
