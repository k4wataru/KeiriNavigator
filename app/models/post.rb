class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :selected_comment, class_name: "Comment", optional: true
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def self.looks(search, word)
    if search == "perfect_match"
      where("title LIKE ?", "#{word}")
    elsif search == "forward_match"
      where("title LIKE ?", "#{word}%")
    elsif search == "backward_match"
      where("title LIKE ?", "%#{word}")
    elsif search == "partial_match"
      where("title LIKE ?", "%#{word}%")
    else
      all
    end
  end
  
 def favorited_by?(user)
   favorites.exists?(user_id: user.id)
 end
 
  def good_count
    favorites.count
  end

  validates :title,presence:true
  validates :content,presence:true,length:{maximum:500}
end
