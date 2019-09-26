class Restaurant < ApplicationRecord
  belongs_to :category
  has_many :reviews, dependent: :destroy

  before_validation { self.name = name.titleize }
  before_validation { self.city = city.titleize }
  before_validation { self.county = county.titleize }

  validates :name, presence: true, uniqueness: { scope: [:category_id, :city, :county],
                                   message: " error: restaurant already exists" }
  validates :city, presence: true
  validates :county, presence: true

  def Restaurant.search(params)
    restaurants = Restaurant.where(category_id: params[:category].to_i)
    restaurants = restaurants.where("name like ?", "%#{params[:search].titleize}%") if params[:search].present?
    restaurants = restaurants.where("city like ? or county like ?", "%#{params[:location].titleize}%",
                                    "%#{params[:location].titleize}%") if params[:location].present?
    restaurants
  end
end
