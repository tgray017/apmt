class WelcomeController < ApplicationController

  def home
    redirect_to tickets_path if logged_in?
  end

end
