class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to tickets_path
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(:id => params[:id])
    if @user
      authorize @user
    else
      redirect_to root_path, :flash => {:alert => "User does not exist."}
    end
  end

  def update
    @user = User.find_by(:id => params[:id])
    if @user
      authorize @user
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render :edit
      end
    else
      redirect_to root_path, :flash => {:alert => "User does not exist."}
    end
  end

  def show
    @user = User.find_by(:id => params[:id])
    unless @user
      redirect_to root_path, :flash => {:alert => "User does not exist."}
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_admin)
    end
end
