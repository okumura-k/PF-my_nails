class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :nails, dependent: :destroy
  has_many :nail_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :likes
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follower
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :user


  validates :name, length: { minimum: 2, maximum: 20 }, presence: true

  has_one_attached :profile_image

  def get_profile_image
    (profile_image.attached?) ? profile_image : "no_image.jpg"
  end
  
  
  #既にフォローしているか？
  def following?(user)
    followings.include?(user)
  end 
  #フォローを保存
  def follow(user_id)
    relationships.create(follower: user_id)
  end 
  #フォロー解除
  def unfollow(relationship_id)
    relationships.find(relationship_id).destroy!
  end 
  
end
