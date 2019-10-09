class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(:email => params[:user][:email])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
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
