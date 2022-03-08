class Nail < ApplicationRecord
  belongs_to :user
  has_many :nail_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_one_attached :image
  
  validates :image, presence: true
  validates :introduction, presence: true
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
