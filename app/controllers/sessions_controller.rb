class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(:email => params[:user][:email])
    if @user
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        redirect_to login_path, :flash => {:alert => "Incorrect password."}
      end
    else
      redirect_to login_path, :flash => {:alert => "User not found."}
    end
  end

  def destroy
    session.delete(:user_id) if logged_in?
    redirect_to root_path
  end

  def oauth
    @user = User.find_or_create_by_omniauth(auth)
    session[:user_id] = @user.id
    redirect_to root_path
  end

  private

    def auth
      request.env['omniauth.auth']
    end

end
