class Admin::CommentsController < ApplicationController
 
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to admin_post_path(comment.post), notice: "Comment was successfully deleted."
  end
end
