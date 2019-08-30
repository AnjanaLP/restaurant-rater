class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please login to continue"
      redirect_to login_path
    end
  end
end
