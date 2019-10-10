class WelcomeController < ApplicationController
  skip_before_action :require_login, only: :home

  def home
    redirect_to tickets_path if logged_in?
  end

end
