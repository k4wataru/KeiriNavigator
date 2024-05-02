class AddSelectedCommentIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :selected_comment_id, :integer
  end
end