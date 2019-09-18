class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 1000 }
  validates :rating, presence: true
end
