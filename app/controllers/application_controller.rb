class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(:id => session[:user_id])
  end

  def logged_in?
    !!current_user
  end


  private

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
end
