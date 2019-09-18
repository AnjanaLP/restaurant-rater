class Restaurant < ApplicationRecord
  belongs_to :category
  has_many :reviews

  before_validation { name.capitalize! }
  before_validation { city.capitalize! }
  before_validation { county.capitalize! }

  validates :name, presence: true, uniqueness: { scope: [:category_id, :city, :county],
                                   message: " of restaurant already exists in selected category and location" }
  validates :city, presence: true
  validates :county, presence: true

  def Restaurant.search(params)
    restaurants = Restaurant.where(category_id: params[:category].to_i)
    restaurants = restaurants.where("name like ?", "%#{params[:search]}%") if params[:search].present?
    restaurants = restaurants.where("city like ? or county like ?", "%#{params[:location]}%",
                                    "%#{params[:location]}%") if params[:location].present?
    restaurants
  end
end
