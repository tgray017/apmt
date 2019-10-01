class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # why isn't it failing if password_digest != password_confirmation
    if @user.save
      redirect_to tickets_path
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :is_admin)
    end
end
