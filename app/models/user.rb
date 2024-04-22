class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
         
  has_one_attached :image
  
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      where("name LIKE ?", "#{word}")
    elsif search == "forward_match"
      where("name LIKE ?", "#{word}%")
    elsif search == "backward_match"
      where("name LIKE ?", "%#{word}")
    elsif search == "partial_match"
      where("name LIKE ?", "%#{word}%")
    else
      all
    end
  end
  
  validates :name, presence: true, uniqueness: true #ユーザー名に一意性をもたせる
end
