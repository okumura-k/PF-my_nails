class NailComment < ApplicationRecord
  belongs_to :user
  belongs_to :nail
  validates :comment, presence: true
end
