class Like < ApplicationRecord
  belongs_to :user
  belongs_to :nail

  validates :user_id, uniqueness: { scope: :nail_id }
end
