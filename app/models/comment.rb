class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  def self.looks(search, word)
    if search == "perfect_match"
      where("content LIKE ?", "#{word}")
    elsif search == "forward_match"
      where("content LIKE ?", "#{word}%")
    elsif search == "backward_match"
      where("content LIKE ?", "%#{word}")
    elsif search == "partial_match"
      where("content LIKE ?", "%#{word}%")
    else
      all
    end
  end  

end
