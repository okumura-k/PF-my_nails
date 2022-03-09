class Nail < ApplicationRecord
  belongs_to :user
  has_many :nail_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :image

  validates :image, presence: true
  validates :introduction, presence: true
  
  def liked_by(user)
    Like.find_by(user_id: user.id, nail_id: id)
  end 

  def get_image
    (image.attached?) ? image : "no_image.jpg"
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
