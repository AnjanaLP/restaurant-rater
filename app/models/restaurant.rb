class Restaurant < ApplicationRecord
  belongs_to :category
  has_many :reviews

  validates :name, presence: true
  validates :address_1, presence: { message: "- please enter building name/number"}
  validates :address_2, presence: { message: "- please enter street name"}
  validates :city, presence: true
  validates :county, presence: true
end
