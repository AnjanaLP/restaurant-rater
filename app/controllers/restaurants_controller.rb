class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :edit, :create, :update, :destroy]
  before_action :admin_user, only: [:edit, :update, :destroy]

  def new
    @restaurant = Restaurant.new
  end

  def show
    @reviews = Review.where(restaurant_id: @restaurant)
    @paginated_reviews = @reviews.paginate(page: params[:page])
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @restaurant.update_attributes(restaurant_params)
      flash[:success] = "Restaurant successfully updated"
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant.destroy
    flash[:success] = "Restaurant successfully deleted"
    redirect_to root_url
  end

  def search
    @restaurants = Restaurant.search(params).paginate(page: params[:page])
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :category_id, :address_1, :address_2,
                                         :city, :county, :phone, :email)
    end
end
