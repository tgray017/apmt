class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :require_login

  def current_user
    @current_user ||= User.find_by(:id => session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless logged_in?
      flash[:alert] = "Log in to view this resource."
      redirect_to root_path
    end
  end


  private

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
end
