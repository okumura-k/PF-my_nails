class NailComment < ApplicationRecord
  belongs_to :user
  belongs_to :nail
end
