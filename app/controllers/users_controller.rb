class UsersController < ApplicationController
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
    @user = User.find(params[:id])
    redirect_to root_path unless @user == current_user
  end

  def show

  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_admin)
    end
end
