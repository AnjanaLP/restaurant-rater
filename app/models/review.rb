class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :user_id, presence: true
  validates :content, presence: true
  validates :rating, presence: true
end
