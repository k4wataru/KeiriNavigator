class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
         
  has_one_attached :image
  
  validates :name, presence: true, uniqueness: true #ユーザー名に一意性をもたせる
end
