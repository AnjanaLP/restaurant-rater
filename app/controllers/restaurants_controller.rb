class RestaurantsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end


  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :category_id, :address_1, :address_2,
                                         :city, :county, :phone, :email)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please login to continue"
        redirect_to login_path
      end
    end
end
