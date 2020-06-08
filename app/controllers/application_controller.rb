class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def home; end

  private

  # Before filters

  # Confirms and filters a logged-in user.
  def logged_in_user
    if logged_in?
      redirect_to(user_path(@current_user)) if params[:id] != @current_user.id.to_s
    else
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end
end
