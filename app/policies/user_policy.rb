class UserPolicy < ApplicationPolicy

  def initialize(user, selected_user)
    @user = user
    @selected_user = selected_user
  end

  def edit?
    @user == @selected_user
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
